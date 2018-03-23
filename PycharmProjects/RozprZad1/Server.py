import socket
import threading
import ServerThread


def broadcast_multimedia():
    """function that sends UDP message to every other user"""
    while True:
        data, addr = udp_s.recvfrom(BUFFER_SIZE)
        if addr in [a[1] for a in udp_clients]:  # check whether the user has sent something earlier ("connected")
            sender = [a[0] for a in udp_clients if a[1] == addr][0]  # ugly way to get nickname of the sender
            print('Got multimedia from ' + sender.decode() + ' broadcasting...')
            for client in udp_clients:  # broadcast
                if client[1] != addr:  # do not send the message to the sender
                    message = sender + bytes(': ', 'utf-8') + data
                    udp_s.sendto(message, client[1])
            
        else:  # add new user to UDP collection
            print('New udp client: ' + str(addr))
            udp_clients.append((data, addr))

            
# constants of server socket
IP = '127.0.0.1'
PORT = 9009
BUFFER_SIZE = 1024

# max number of clients
MAX_THREADS = 5

if __name__ == '__main__':
    # establish TCP server socket and listen
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.bind((IP, PORT))
    s.listen(1)

    # establish UDP server socket
    udp_s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp_s.bind(('', PORT))
    udp_clients = []

    # connected users
    pool = []
    threadID = 0

    # start new thread to handle UDP messages
    broadcast_udp_thread = threading.Thread(target=broadcast_multimedia)
    broadcast_udp_thread.start()

    # start accepting clients
    while True:
        if len(pool) < MAX_THREADS:
            connection, address = s.accept()

        nickname = (connection.recv(BUFFER_SIZE))
        print("new client name: " + nickname.decode('utf-8') + ", ID: " + str(threadID))
        pool.append((nickname, connection, threadID))

        ServerThread.ServerThread(threadID, connection, nickname, pool).start()
        threadID += 1





    #connection.close()

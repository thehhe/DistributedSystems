import socket
import threading


def send():
    """Send user input.
       If message is 'U ' followed by Enter, the multi-line input will be possible.
       Finish with Ctrl+D and the message will be sent via UDP.

       Without any special header the message is sent via TCP """
    while True:
            message = input()
            if message == 'U ':
                print("Paste your multi-line message then add 'End.' as last line to finish")
                contents = []
                while True:
                    line = input()
                    if line == 'End.':
                        break
                    contents.append(line)
                #print(contents)
                udp_s.sendto('\r\n'.join(contents).encode(), (IP, PORT))
            else:
                s.send(message.encode())


def receive():
    """Receive message via TCP"""
    while True:
        data = s.recv(BUFFER_SIZE)
        print(data.decode('utf-8'))


def receive_udp():
    """Receive message via UDP"""
    while True:
        data, addr = udp_s.recvfrom(BUFFER_SIZE)
        media = data.decode('utf-8')
        print(media)


#server socket constants
IP = '127.0.0.1'
PORT = 9009
BUFFER_SIZE = 1024

if __name__ == '__main__':
    name = input('Give your nickname: ')

#   establish TCP socket and connect to the server
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((IP, PORT))
    s.send(name.encode())

#   establish UDP socket and send nickname
    udp_s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    udp_s.sendto(name.encode(), (IP, PORT))

#   start new thread to send messages
    thread_send = threading.Thread(target=send)
    thread_send.start()

#   start new thread to receive TCP messages
    thread_receive = threading.Thread(target=receive)
    thread_receive.start()

#   start new thread to receive UDP messages
    thread_receive_udp = threading.Thread(target=receive_udp)
    thread_receive_udp.start()



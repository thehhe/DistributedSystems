import threading

BUFFER_SIZE = 1024


class ServerThread(threading.Thread):
    """simple thread that broadcasts the message upon receiving one via TCP"""
    def __init__(self, thread_id, connection, nickname, pool):
        threading.Thread.__init__(self)
        self.thread_id = thread_id
        self.connection = connection
        self.nickname = nickname
        self.pool = pool

    def run(self):
        while True:
            data = self.nickname + ': '.encode() + self.connection.recv(BUFFER_SIZE)
            if data:
                print(self.nickname.decode('utf-8') + " spoke")
            for client in self.pool:
                if self.thread_id != client[2]:
                    client[1].send(data)  # send to every other connected client
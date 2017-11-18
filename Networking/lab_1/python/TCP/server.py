# 3.   A client sends to the server a string. The server returns the reversed string to the client (characters from the end to begging)

import socket, struct

def read_string(source):
	c = ''
	s = ''
	while( c != '\n'):
		c = source.recv(1)
		s+=c
	return s[:-1]

def solve_client(client):
	string = read_string(client)
	client.sendall(string[::-1] + '\n')

if __name__ == "__main__":

	print(socket.gethostname())

	try:
		rs=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		rs.bind( ('0.0.0.0',8090) )
		rs.listen(5)
	except socket.error as msg:
		print(msg.strerror)
		exit(-1)

	while True:
		print('Waiting clients..')
		client_socket, addrc = rs.accept()
		print('Client ' + str(addrc) + ' has connected.')

		solve_client(client_socket)

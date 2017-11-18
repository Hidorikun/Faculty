# 3.   A client sends to the server a string. The server returns the reversed string to the client (characters from the end to begging)

import socket, struct

def read_string(source):
	c = ''
	s = ''
	while( c != '\n'):
		c = source.recv(1)
		s+=c
	return s[:-1]

if __name__ == "__main__":
	try:
		server = socket.create_connection( ('localhost',8090))
	except socket.error as msg:
		print("Error: ",msg.strerror)
		exit(-1)

	print('Connected.')

	msg = str(raw_input('string: ') + '\n')

	server.sendall(bytes(msg))

	answer = read_string(server)
	print(answer)

# Application: A client sends to a server a string and a character C.
# The server returns all the characters in the string that preceded C's last appearance.

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
		server = socket.create_connection( ('localhost',9996))
	except socket.error as msg:
		print("Error: ",msg.strerror)
		exit(-1)

	print(server)

	msg = str(raw_input('answer: ') + '\n')
	c = str(raw_input('c: ') + '\n')

	server.sendall(bytes(msg))
	server.sendall(bytes(c))

	answer = read_string(server)
	print(answer)

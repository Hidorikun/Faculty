# Application: A client sends to a server a string and a character C.
# The server returns all the characters in the string that preceded C's last appearance.

import socket, struct

print(socket.gethostname())

def read_string(source):
	c = ''
	s = ''
	while( c != '\n'):
		c = source.recv(1)
		s+=c
	return s[:-1]

def solve_client(client):
	string = read_string(client)
	c = read_string(client)

	index = string.rfind(c)

	if ( index < 0 ):
		client.sendall(string + '\n')
	else:
		client.sendall(string[:index] + '\n')


if __name__ == "__main__":
	try:
		rs=socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		rs.bind( ('0.0.0.0',9996) )
		rs.listen(5)
	except socket.error as msg:
		print(msg.strerror)
		exit(-1)

	while True:
		client_socket, addrc = rs.accept()
		print('Client ' + str(addrc) + 'has connected')

		solve_client(client_socket)

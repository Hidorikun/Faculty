#little client to get our problem form the teacher's server

import socket, struct

def read_string(source):
	c = ''
	s = ''
	while( c != '\n'):
		c = source.recv(1)
		s+=c
	return s[:-1]

if __name__ == "__main__":
	teacher_ip = '172.30.113.3'
	teacher_port = 5432

	try:
		server = socket.create_connection( (teacher_ip, teacher_port) )
	except socket.error as msg:
		print("Error: ",msg.strerror)
		exit(-1)

	while(True):
		print(read_string(server))
		msg = str(raw_input('answer: ') + '\n')
		server.sendall(bytes(msg))

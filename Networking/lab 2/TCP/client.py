import socket
import struct
import random
import sys
import time

def read_string(source):
	c = ''
	s = ''
	while( c != '\n'):
		c = source.recv(1)
		s+=c
	return s[:-1]

if __name__ == '__main__':
	try:
		server = socket.create_connection(('localhost',8090))
	except socket.error as msg:
		print("Error: ", msg.strerror)
		exit(-1)
	greeting = read_string(server)
	print(greeting + "\n")

	random.seed()
	my_guess = random.randint(0, 1001)
	print('My guess: {} '.format(my_guess))

	try:
		server.sendall( struct.pack('!I', my_guess) )
	except socket.error as msg:
		print('Error: ', msg.strerror)
		server.close()
		exit(-2)

	print('Waiting answer..')
	answer = read_string(server)
	print(answer)
	server.close()

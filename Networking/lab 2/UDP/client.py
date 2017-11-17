import socket
import struct
import random
import sys
import time

INT = 4

if __name__ == '__main__':
	server_ip = 'localhost'
	server_port = 8090

	try:
		server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
	except socket.error as msg:
		print("Error: ", msg.strerror)
		exit(-1)

	random.seed()
	my_guess = random.randint(0, 1001)
	print('My guess: {} '.format(my_guess))

	try:
		server.sendto( struct.pack('!I', my_guess), (server_ip, server_port))
	except socket.error as msg:
		print('Error: ', msg.strerror)
		exit(-2)

	greeting, addr = server.recvfrom(1024)
	print(greeting + "\n")

	print('Waiting answer..')
	answer, addr = server.recvfrom(1024)
	print(answer)
	server.close()

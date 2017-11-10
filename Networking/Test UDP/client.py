#Application: A client sends a string to a server.
#Server returns the character that is found the least in the string and the positions it appears.

import socket, struct


if __name__ == "__main__":
	server_ip = 'localhost'
	server_port = 9996

	try:
		server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
	except socket.error as msg:
		print("Error: ",msg.strerror)
		exit(-1)

	msg = str(raw_input('string: ') + '\n')

	server.sendto(bytes(msg), (server_ip, server_port))

	data, addr = server.recvfrom(1000)
	print(data)

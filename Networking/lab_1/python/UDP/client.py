# 3.   A client sends to the server a string. The server returns the reversed string to the client (characters from the end to begging)

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

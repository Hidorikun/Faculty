# 3.   A client sends to the server a string. The server returns the reversed string to the client (characters from the end to begging)

import socket, struct

print(socket.gethostname())

def solve_client(client, data):
		data = data[:-1]
		rs.sendto(bytes(data[::-1]), addr)

if __name__ == "__main__":
	try:
		rs=socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
		rs.bind( ('0.0.0.0',9996) )
	except socket.error as msg:
		print(msg.strerror)
		exit(-1)

	while True:
		data, addr = rs.recvfrom(1000)
		print( addr, data )

		solve_client(addr, data)

#Application: A client sends a string to a server.
#Server returns the character that is found the least in the string and the positions it appears.

import socket, struct

print(socket.gethostname())

def solve_client(client, data):
		data = data[:-1]
		apparitions = {}

		for c in data:
			if c in apparitions:
				apparitions[c]+=1
			else:
				apparitions[c] = 1

		character = min(apparitions, key=  apparitions.get)

		positions = [ i for i, c in enumerate(data) if c == character]
		result = character + " on positions: " + ', '.join([str(c) for c in positions])

		rs.sendto(bytes(result), addr)

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

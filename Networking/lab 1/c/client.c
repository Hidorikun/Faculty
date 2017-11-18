//3.   A client sends to the server a string. The server returns the reversed string to the client (characters from the end to begging)
#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>

int main() {
	int c;
	struct sockaddr_in server;

	c = socket(AF_INET, SOCK_STREAM, 0);

	if (c < 0) {
		printf("Eroare la crearea socketului cslient\n");
		return 1;
	}

	memset(&server, 0, sizeof(server));
	server.sin_port = htons(1235);
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = inet_addr("127.0.0.1");

	if (connect(c, (struct sockaddr *) &server, sizeof(server)) < 0) {
		printf("Eroare la conectarea la server\n");
		return 1;
	}

	size_t a;
	char b[100];

	printf("str: ");
	fgets(b, sizeof(b), stdin);
	a = strlen(b);

	a = htonl(a);
	send(c, &a, sizeof(a), 0);
	a = ntohl(a);
	send(c, b, a, 0);

	memset(b, 0, a);
	recv(c, b, a, MSG_WAITALL);

	printf("%s\n", b);

	close(c);
}

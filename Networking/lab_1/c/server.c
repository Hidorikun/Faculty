//3.   A client sends to the server a string. The server returns the reversed string to the client (characters from the end to begging)
#include <sys/types.h>
#include <sys/socket.h>
#include <stdio.h>
#include <netinet/in.h>
#include <netinet/ip.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

void reverse(char* str){
	size_t n = strlen(str);
	size_t mid = n / 2;
	for (size_t i = 0; i <=mid; i++){
		char aux = str[i];
		str[i] = str[n-1 -i];
		str[n-1 -i] = aux;
	}
}

int main() {
	char *host_name = (char*)malloc(100 * sizeof(char));
	gethostname(host_name, sizeof(host_name));
	printf("%s\n", host_name);

	int s;
	struct sockaddr_in server, client;
	int c, l;

	s = socket(AF_INET, SOCK_STREAM, 0);
	if (s < 0) {
		printf("Error conncting to socket.\n");
		return 1;
	}

	memset(&server, 0, sizeof(server));
	server.sin_port = htons(1235);
	server.sin_family = AF_INET;
	server.sin_addr.s_addr = INADDR_ANY;

	if (bind(s, (struct sockaddr *) &server, sizeof(server)) < 0) {
		printf("This port is already in use.\n");
		return 1;
	}

	listen(s, 5);

	l = sizeof(client);
	memset(&client, 0, sizeof(client));

	while (1) {
		size_t a;
		char* b;
		printf("Waiting clients..\n");
		c = accept(s, (struct sockaddr *) &client, &l);
		printf("A client has connected\n");

		recv(c, &a, sizeof(a), MSG_WAITALL);
		a = ntohl(a);

		b = (char*)malloc(a+1);

		recv(c, b, a, MSG_WAITALL);

		reverse(b);
		printf("%s\n", b);

		send(c, b, a, 0);

		close(c);

	}
}

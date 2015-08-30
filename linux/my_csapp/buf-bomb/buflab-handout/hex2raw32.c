#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <unistd.h>

void usage(const char *prog);
char *convert_to_byte_string(FILE *fp, int *plen);

int main(int argc, char **argv) {
	int option;
	int repeat = 1;
	int count;
	char *buf = NULL;
	char ch;

	while ((option = getopt(argc, argv, "nh")) != -1) {
		if (option == 'h') {
			usage(argv[0]);
			return 0;
		}
		else if (option == 'n') {
			repeat = 5;
		}
		else {
			usage(argv[0]);
			return -1;
		}
	}

	buf = convert_to_byte_string(stdin, &count);
	if (buf == NULL)
		return -1;

	ch = '\n';
	while (repeat-- > 0) {
		write(1, buf, count); /* stdout */
		write(1, &ch, 1);
	}

	return 0;
}

int convert_to_hex_value(const char *hexstr) {
	int val;
	sscanf(hexstr, "%x", &val);
	return val;
}

void usage(const char *prog) {
	printf("usage: %s [-n] [-h]\n", prog);
	puts(" -n Nitro mode");
	puts(" -h Print this help message");
}

char *convert_to_byte_string(FILE *fp, int *plen) {
	FILE *fin = fp;
	char *buf = NULL;
	char comment_start[] = "/*";
	char comment_end[] = "*/";
	char str[1024];
	int cnt = 0;
	int num = 0;
	int maxline = 1024;

	if ((buf = malloc(maxline)) == NULL)
		return NULL;

	while (fscanf(fin, "%s", str) > 0) {
		if (!strcmp(str, comment_start)) {
			cnt++;
			continue;
		}
		else if (!strcmp(str, comment_end)) {
			if (cnt > 0)
				cnt--;
			else {
				fprintf(stderr, "Error: stray %s found.\n", comment_end);
				free(buf);
				buf = NULL;
				return NULL;
			}
		}
		else {
			if (cnt == 0) { /* not comment */
				if (isxdigit(str[0]) && isxdigit(str[1]) && str[2] == '\0') {
					if (num == maxline) {
						maxline *= 2;
						buf = realloc(buf, maxline);
						if (buf == NULL)
							return NULL;
					}
					buf[num++] = convert_to_hex_value(str);
				}
				else {
					fprintf(stderr,"Invalid hex value [%s]. Please specify only "
							"single byte hex values separated by whitespace.\n", str);
					free(buf);
					buf = NULL;
					return NULL;
				}
			}
		}
	}

	*plen = num;
	return buf;
}

#include <cstdio>

#include "decrypt.hpp"
#include "encData.hpp"

int main() {
	char ssid[33];
	char password[64];

	
	decryptShuffled(ENCRYPTED_FIELD, 0, ssid);
	decryptShuffled(ENCRYPTED_FIELD, 1, password);

	fprintf(stdout, "SSID: \"%s\"\nPassword: \"%s\"\n", ssid, password);
	fflush(stdout);

	return 0;
}


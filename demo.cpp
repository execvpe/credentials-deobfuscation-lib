
#include <cstdlib>
#include <iostream>

#include "deobfuscate.hpp"
#include "obfuscatedData.hpp"

int main() {
	char ssid[33];
	char password[65];

	using namespace ObfuscatedCredentials;

	deobfuscate(data, 0, ssid);     // first String which was obfuscated
	deobfuscate(data, 1, password); // second String

	std::cout << "SSID: " << ssid << "\nPassword: " << password << std::endl;

	return EXIT_SUCCESS;
}

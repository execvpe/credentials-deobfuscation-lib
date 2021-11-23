#include "decrypt.hpp"

void decryptShuffled(const uint8_t *__restrict raw, size_t idxPos, char *__restrict buf) {
	const uint8_t *chars = raw + ((size_t) raw[0]);
	const uint8_t *head = raw + ((size_t) raw[idxPos + 1]) + 1;
	const size_t len = (size_t) raw[(size_t) raw[idxPos + 1]];
	
	for (size_t i = 0; i < len; i++) {
		buf[i] = chars[(size_t) head[i]];
	}
	buf[len] = '\0';
}


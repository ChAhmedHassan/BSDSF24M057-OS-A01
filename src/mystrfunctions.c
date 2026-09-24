#include "mystrfunctions.h"

int mystrlen(const char *s) {
    int n = 0;
    while (s[n] != '\0') n++;
    return n;
}

char *mystrcpy(char *dest, const char *src) {
    int i = 0;
    while ((dest[i] = src[i]) != '\0') i++;
    return dest;
}

char *mystrcat(char *dest, const char *src) {
    int n = mystrlen(dest);
    int i = 0;
    while ((dest[n + i] = src[i]) != '\0') i++;
    return dest;
}

int mystrcmp(const char *a, const char *b) {
    int i = 0;
    while (a[i] != '\0' && a[i] == b[i]) i++;
    return (unsigned char)a[i] - (unsigned char)b[i];
}

void mystrrev(char *s) {
    int i = 0, j = mystrlen(s) - 1;
    while (i < j) {
        char t = s[i];
        s[i] = s[j];
        s[j] = t;
        i++;
        j--;
    }
}


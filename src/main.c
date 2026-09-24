#include <stdio.h>
#include "mystrfunctions.h"
#include "myfilefunctions.h"

int main(void) {
    char a[100] = "Hello";
    char b[100];
    char c[100] = "Hello, ";

    printf("=== String functions ===\n");
    printf("mystrlen(\"%s\") = %d\n", a, mystrlen(a));

    mystrcpy(b, a);
    printf("mystrcpy: b = %s\n", b);

    mystrcat(c, "World");
    printf("mystrcat: c = %s\n", c);

    printf("mystrcmp(a, b) = %d\n", mystrcmp(a, b));

    mystrrev(b);
    printf("mystrrev: b = %s\n", b);

    printf("\n=== File functions ===\n");
    const char *file = "src/main.c";
    printf("Lines in %s: %d\n", file, count_lines(file));
    printf("Words in %s: %d\n", file, count_words(file));
    printf("Occurrences of 'printf' in %s: %d\n", file, count_pattern(file, "printf"));

    return 0;
}


#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include "myfilefunctions.h"

int count_lines(const char *filename) {
    FILE *f = fopen(filename, "r");
    if (!f) return -1;
    int lines = 0, c;
    while ((c = fgetc(f)) != EOF)
        if (c == '\n') lines++;
    fclose(f);
    return lines;
}

int count_words(const char *filename) {
    FILE *f = fopen(filename, "r");
    if (!f) return -1;
    int words = 0, in_word = 0, c;
    while ((c = fgetc(f)) != EOF) {
        if (isspace(c)) in_word = 0;
        else if (!in_word) { in_word = 1; words++; }
    }
    fclose(f);
    return words;
}

int count_pattern(const char *filename, const char *pattern) {
    FILE *f = fopen(filename, "r");
    if (!f) return -1;
    char line[1024];
    int count = 0;
    while (fgets(line, sizeof(line), f)) {
        char *p = line;
        while ((p = strstr(p, pattern)) != NULL) {
            count++;
            p += strlen(pattern);
        }
    }
    fclose(f);
    return count;
}


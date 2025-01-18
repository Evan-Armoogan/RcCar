#include <cstring>

// If all is well, this string should exist somewhere in the .elf file
const char* string = "Hello, World!";

int main()
{
    char* c_arr = new char[strlen(string) + 1];

    std::memset(c_arr, 0, sizeof(strlen(string) + 1));
    for (int i = 0; i < (int)strlen(string); i++)
    {
        c_arr[i] = string[i];
    }

    delete[] c_arr;

    return 0;
}

#include<iostream>
#include <string>

int main(int argc, char* argv[])
{
	if (argc >= 2)
	{
        std::cout << argv[1] << " is " << atoi(argv[1]) / 2 << std::endl;
	}
	return 0;
}
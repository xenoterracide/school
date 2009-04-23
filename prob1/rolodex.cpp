#include <iostream>
#include <string>

using namespace std;

struct contact
{
	int	record;
	string fname;
	string lname;
	string addr1;
	string addr2;
	string city;
	char state[2];
	char zip[5]; // zips aren't int, see me for rationale
};

int main() {
}

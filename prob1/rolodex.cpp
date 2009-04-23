#include <iostream>
#include <string>
#include <vector>

using namespace std;

struct contact_rec
{
	int	record;
	string fname;
	string lname;
	string addr1;
	string addr2;
	string city;
	char state[2];
	/* a zip code is not an integer. You can't perform mathematical operations 
	 * on them therefore they cannot be an integer */
	char zip[5];
};

int main() {
	string opt;
	
	while ( opt != "q" ) {
		if ( opt != "n" ) {
			cout << "(n)ew contact (q)uit: ";
			cin >> opt;
		}
	}
}

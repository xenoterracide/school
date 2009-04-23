#include <iostream>
#include <iomanip>
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
} new_contact;

vector<contact_rec> contact;

void get_contact()
{
	cout << "First Name: ";
	cin  >> new_contact.fname;
	cout << "Last Name: ";
	cin  >> new_contact.lname;
	cout << "Address 1 (street): ";
	cin  >> new_contact.addr1;
	cout << "Address 2 (apt, suite, etc): ";
	cin  >> new_contact.addr2;
	cout << "City: ";
	cin  >> new_contact.city;
	cout <<  "State (2 char code): ";
	cin  >> setw(2) >> new_contact.state;
	cout <<  "ZIP code: ";
	cin  >> setw(5) >> new_contact.zip;

	new_contact.record = contact.size();

	contact.push_back(new_contact);
}

int main()
{
	string opt;
	
	while ( opt != "q" ) {
		if ( opt != "n" ) {
			cout << "(n)ew contact (q)uit: ";
			cin >> opt;
		} else {
			get_contact();
			opt = "";
		}
	}
}

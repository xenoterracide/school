#include <ctype.h>
#include <fstream>
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
	string state;
	char zip[5];
} new_contact;

vector<contact_rec> contact;

bool str_isnum(string str)
{
	for ( int i = 0; i < str.size(); i++) {
		if ( isdigit(str.at(i)) != 0 ) {
			return false;
		}
	}
	return true;
}

void get_contact()
{
	bool valid = false;
	string tmp;

	new_contact.record = contact.size();

	cout << "First Name: ";
	getline ( cin, new_contact.fname, '\n');
	cout << "Last Name: ";
	getline ( cin, new_contact.lname, '\n');
	cout << "Address 1 (street): ";
	getline ( cin, new_contact.addr1, '\n');
	cout << "Address 2 (apt, suite, etc): ";
	getline ( cin, new_contact.addr2, '\n');
	cout << "City: ";
	getline ( cin, new_contact.city, '\n');
	cout <<  "State (2 char code): ";
	getline ( cin, new_contact.state, '\n');
	while ( valid != true ) {
		cout <<  "ZIP code: ";
		getline ( cin, tmp, '\n');
		if ( tmp.size() == 5 && str_isnum(tmp) == 0 ) {
			valid = true;
		} else {
			cout << "error: Invalid zip code\n"
				<< "DEBUG: " << tmp.size() << "\n"
				<< "DEBUG: " << str_isnum(tmp) << "\n";
		}
	}
		
	contact.push_back(new_contact);
}

void print_csv_rolodex()
{
	ofstream csv;

	csv.open("rolodex.csv");

	for (size_t i = 0; i < contact.size(); i++) {
		csv
			<< contact.at(i).record << ","
			<< contact.at(i).fname << ","
			<< contact.at(i).lname << ","
			<< contact.at(i).addr1 << ","
			<< contact.at(i).addr2 << ","
			<< contact.at(i).city << ","
			<< contact.at(i).state << ","
			<< contact.at(i).zip << "\n";
	}
	csv.close();
}

int main()
{
	string opt;
	
	while ( opt != "q" ) {
		if ( opt != "n" ) {
			cout << "(n)ew contact (q)uit: ";
			getline( cin, opt, '\n' );
		} else {
			get_contact();
			opt = "";
		}
	}
	print_csv_rolodex();
}

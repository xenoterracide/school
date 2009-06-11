/*
	Copyright 2009 by
		Caleb Cushing <xenoterracide@gmail.com>
		Amanda Cobb
		Kris Richardson
   	All Rights Reserved

	This file is part of oc

	oc is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	oc is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with oc.  If not, see <http://www.gnu.org/licenses/>.
*/
#include <iostream>
#include <cstdlib>
#include <string>
#include <iomanip>
#include <fstream>
#include <ctime>
#include <vector>
#include <sstream>

using namespace std;

//Declare the constant variables
const double OIL_CHANGE = 19.95;
const double FULL_OIL_CHANGE = 34.95;
const double TRANS_FLUID = 109.99;
const double RADIATOR_FLUID = 69.99;
const double DIFFERENTIAL = 79.99;
const double SALES_TAX = .06;

struct customer_record
{
	unsigned int record;
	string fname;
	string lname;
	string home;
	string work;
	string cell;
	string license_plate;
} new_customer;

vector<customer_record> customers;

void debugCustVecStruct();
void garbageDataHandler();
void getCusInfo();
void getSerInfo();
void mainMenu();
void printCustRecord(const unsigned int& i);
void readCustData();
void searchSerCompleted();
void searchCustMenu();
void searchCustRecord();
void writeCustData();

int main()
{
	//Declare Variables
	readCustData();
	mainMenu();
	//The main menu
	return 0;
}

// basically were' just printing the array to stdout
void debugCustVecStruct()
{
	for (unsigned int i = 0; i < customers.size(); i++) {
		printCustRecord(i);
	}
}
/*
 * storing garbage from cin here.
 * cin.clear() and cin.ignore() don't seem to clear cin adequately
 */
void garbageDataHandler()
{
	string garbage;
	getline( cin, garbage);
	garbage = "\0";
}

/*
pull the system date
use a counter for each service
get a grand total for each service used
query sales and services by date ranges
*/
void getCusInfo()
{
	int confirm=0;
	while (confirm != 1)
	{
		garbageDataHandler();

		new_customer.record = customers.size();

		cout << "First Name: ";
		getline( cin, new_customer.fname);

		cout << "Last Name: ";
		getline( cin, new_customer.lname);

		cout << "Home Phone: ";
		getline( cin, new_customer.home);

		cout << "Cell Phone: ";
		getline( cin, new_customer.cell);

		cout << "Work Phone: ";
		getline( cin, new_customer.work);

		cout << "Plate Number: ";
		getline( cin, new_customer.license_plate);
		cout << endl << endl;

		cout << "Is this correct?  (1=yes, 2=no)";
		cin >> confirm;
		if (confirm == 1) {
			customers.push_back(new_customer);
			writeCustData();
		}
		cout << endl << endl;
	}
}
void getSerInfo()
{
	int index, num, counter = 0;
	double subTotal1 = 0.0, subTotal2 = 0.0, subTotal3 = 0.0, subTotal4 = 0.0, subTotal5 = 0.0;
	double grandSubTotal, salesTax, totalDue;

	//print the date and time
	time_t timeStr;

	timeStr = time(NULL);
	cout << "The current date is: " << ctime(&timeStr) << endl;

	ofstream serOutFile;

	//open the file to write customer information to
	serOutFile.open("services.txt", ios::app);

	serOutFile << fixed << showpoint;
	serOutFile << setprecision(2);

	cout << "How many services were completed: ";
	cin >> index;
	cout << endl;

	//display the services menu to the user
	cout
		<< "*****Quick Oil Change Station*****" << endl
		<< "*                                *" << endl
		<< "************MAIN MENU*************" << endl
		<< "*                                *" << endl
		<< "* 1 - Basic Oil Change           *" << endl
		<< "* 2 - Full Service Oil Change    *" << endl
		<< "* 3 - Transmission Fluid Service *" << endl
		<< "* 4 - Radiator Fluid Exchange    *" << endl
		<< "* 5 - Differential Service       *" << endl
		<< "*                                *" << endl
		<< "**********************************" << endl
		<< "Please choose the service used: ";

	//collect the prices for the services used
	do 
	{
	cin >> num;
	counter++;
	switch (num)
	{
	case 1:
		subTotal1 += OIL_CHANGE;
		break;
	case 2:
		subTotal2 += FULL_OIL_CHANGE;
		break;
	case 3:
		subTotal3 += TRANS_FLUID;
		break;
	case 4:
		subTotal4 += RADIATOR_FLUID;
		break;
	case 5:
		subTotal5 += DIFFERENTIAL;
	}

	//total the services
	grandSubTotal = subTotal1 + subTotal2 + subTotal3 + subTotal4 + subTotal5;
	}

	while (counter < index);

	//time stamp for the file
	serOutFile << "Date: " << ctime(&timeStr) << " : ";

	//determine which services to print to the file
	if (subTotal1 > 0.0)
		serOutFile << "Oil Change : ";
	if (subTotal2 > 0.0)
		serOutFile << "Full Oil Change : ";
	if (subTotal3 > 0.0)
		serOutFile << "Transmission Fluid Service : ";
	if (subTotal4 > 0.0)
		serOutFile << "Radiator Fluid Exchange : ";
	if (subTotal5 > 0.0)
		serOutFile << "Differential Service : ";
	serOutFile << endl;

	//Calculate the sales tax and the total due
	salesTax = grandSubTotal * SALES_TAX;
	totalDue = grandSubTotal + salesTax;

	//Display the output to the user
	cout
		<< "The subtotal is............$" << grandSubTotal << endl
		<< "The sales tax is...........$" << salesTax << endl
		<< "The total due is...........$" << totalDue << endl;

	serOutFile.close();
}

void mainMenu()
{
	int opt;
	do {
		cout
			<< "**********************************\n"
			<< "*    Quick Oil Change Station    *\n"
			<< "************MAIN MENU*************\n"
			<< "*                                *\n"
			<< "* 1 - Add a New Customer         *\n"
			<< "* 2 - Complete a Service         *\n"
			<< "* 3 - Search Services            *\n"
			<< "* 4 - Search For a Customer      *\n"
			<< "* 8 - Debug                      *\n"
			<< "* 9 - Quit                       *\n"
			<< "*                                *\n"
			<< "**********************************\n"
			<< "> ";
		cin >> opt;
		cout << endl;

		switch (opt)
		{
		case 1:
			getCusInfo();
			break;
		case 2:
			getSerInfo();
			break;
		case 3:
			searchSerCompleted();
			break;
		case 4:
			searchCustMenu();
			break;
		case 8:
			debugCustVecStruct();
			break;
		}
	} while (opt != 9);
}
void printCustRecord(const unsigned int& i)
{
		if (i > customers.size()) {
			cout << "No Customer Record Found\n" << endl;
		} else {
			cout
				<< "record: " << customers.at(i).record << "\n"
				<< "fname:  " << customers.at(i).fname  << "\n"
				<< "lname:  " << customers.at(i).lname  << "\n"
				<< "home:   " << customers.at(i).home   << "\n"
				<< "cell:   " << customers.at(i).cell   << "\n"
				<< "work:   " << customers.at(i).work   << "\n"
				<< "plate:  " << customers.at(i).license_plate << "\n"
				<< endl;
		}
}

void searchSerCompleted()
{
	int searchSerPref;
	ifstream serInFile;
//open the file to read customer services from
	serInFile.open("services.txt");
	cout
		<< "******SEARCH SERVICES COMPLETED*****" << endl
		<< "*                                  *" << endl
		<< "*  1 - Basic Oil Change            *" << endl
		<< "*  2 - Full Service Oil Change     *" << endl
		<< "*  3 - Transmission Fluid Service  *" << endl
		<< "*  4 - Radiator Fluid Exchange     *" << endl
		<< "*  5 - Differential Service        *" << endl
		<< "*  6 - Search By Date              *" << endl
		<< "*                                  *" << endl
		<< "************************************" << endl
		<< "Please choose how to conduct your search: ";
	cin >> searchSerPref;

	switch (searchSerPref)
	{
	case  1:
		break;

	case 2:
		break;
	case 3:
		break;
	case 4:
		break;
	case 5:
		break;
	case 6:
		break;
	}
	cout << "you think!??!?!";
	//close the service files
	serInFile.close();
}

void searchCustMenu()
{
	int opt;
//open the file to read customer information from
	cout
		<< "**********CUSTOMER SEARCH***********\n"
		<< "*                                  *\n"
		<< "*  1 - Record                      *\n"
		<< "*  2 - First Name                  *\n"
		<< "*  3 - Last Name                   *\n"
		<< "*  4 - Plate Number                *\n"
		<< "*  5 - Phone Number                *\n"
		<< "*                                  *\n"
		<< "************************************\n"
		<< "How would you like to search for the customer? ";
	cin >> opt;
	cout << "\n"  << endl;
	switch (opt)
	{
	case 1:
		searchCustRecord();
		break;
	case 2:
		break;
	case 3:
		break;
	case 4:
		break;
	case 5:
		break;
	}
}
void searchCustRecord()
{
	int opt;
	int searchParam;

	cout << "Record Number: ";
	cin >> searchParam;
	cout << endl;

	printCustRecord(searchParam);
	
	cout
		<< "************************************\n"
		<< "*                                  *\n"
		<< "*  1 - Update                      *\n"
		<< "*  2 - Delete                      *\n"
		<< "*  2 - Delete                      *\n"
		<< "*  8 - Search Again                *\n"
		<< "*  9 - Main Menu                   *\n"
		<< "*                                  *\n"
		<< "************************************\n"
		<< "> ";
	cin >> opt;
	switch(opt) {
	case 1:
	case 2:
	case 9:
		break;
	}
}
void readCustData()
{
	unsigned int i = 0;
	string line = "\0";
	string field = "\0";
	string token = "\0";

	ifstream csv;
	csv.open("cust.csv");

	if (!csv) {
		cerr << "unable to open cust.csv";
		exit(1);
	}
	// extract comma delimited fields from file
	while (getline(csv, line)) {
		stringstream ss;
		ss << line;
		while ( getline(ss, token, ',')) {
			istringstream iss;
			switch (i) {
			case 0:
				iss.str(token);
				iss >> new_customer.record;
				break;
			case 1:
				new_customer.fname = token;
				break;
			case 2:
				new_customer.lname = token;
				break;
			case 3:
				new_customer.home = token;
				break;
			case 4:
				new_customer.work = token;
				break;
			case 5:
				new_customer.cell = token;
				break;
			case 6:
				new_customer.license_plate = token;
				break;
			}
			++i;
			if (i == 7) {
				i = 0;
			}
		}
		customers.push_back(new_customer);
	}
	csv.close();
	cout << endl;
}
void writeCustData()
{
	ofstream csv;
	csv.open("cust.csv");

	for (unsigned int i = 0; i < customers.size(); i++) {
		csv
			<< customers.at(i).record << ","
			<< customers.at(i).fname << ","
			<< customers.at(i).lname << ","
			<< customers.at(i).home << ","
			<< customers.at(i).work << ","
			<< customers.at(i).cell << ","
			<< customers.at(i).license_plate << endl;
	}
	csv.close();
}

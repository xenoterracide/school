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

void debugVecStruct();
void garbageDataHandler();
void getCusInfo();
void getSerInfo();
void readData();
void searchSerCompleted();
void searchCurrentCus();
void writeData();

int main()
{
	//Declare Variables
	int userChoice;
		
	readData();
	//The main menu
	do {
		cout
			<< "**********************************" << endl
			<< "*    Quick Oil Change Station    *" << endl
			<< "************MAIN MENU*************" << endl
			<< "*                                *" << endl
			<< "* 1 - Add a New Customer         *" << endl
			<< "* 2 - Complete a Service         *" << endl
			<< "* 3 - Search Services            *" << endl
			<< "* 4 - Search For a Customer      *" << endl
			<< "* 8 - Debug                      *" << endl
			<< "* 9 - Quit                       *" << endl
			<< "*                                *" << endl
			<< "**********************************" << endl
			<< "Please choose the service used: ";
		cin >> userChoice;
		cout << endl;

		switch (userChoice)
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
			searchCurrentCus();
			break;
		case 8:
			debugVecStruct();
			break;
		}
	} while (userChoice != 9);
	return 0;
}

void debugVecStruct()
{
	for (unsigned int i = 0; i < customers.size(); i++) {
		cout
			<< "record: " << customers.at(i).record << endl
			<< "fname:  " << customers.at(i).fname  << endl
			<< "lname:  " << customers.at(i).lname  << endl
			<< "home:   " << customers.at(i).home   << endl
			<< "cell:   " << customers.at(i).cell   << endl
			<< "work:   " << customers.at(i).work   << endl
			<< "plate:  " << customers.at(i).license_plate << endl;
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
			writeData();
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

void searchCurrentCus()
{
	int searchSerPref;
	ifstream cusInFile;
//open the file to read customer information from
	cusInFile.open("customer.txt");
	cout
		<< "**********CUSTOMER SEARCH***********" << endl
		<< "*                                  *" << endl
		<< "*  1 - First Name                  *" << endl
		<< "*  2 - Last Name                   *" << endl
		<< "*  3 - Plate Number                *" << endl
		<< "*  4 - Phone Number                *" << endl
		<< "*  5 - Date                        *" << endl
		<< "*                                  *" << endl
		<< "************************************" << endl
		<< "How would you like to search for the customer?  ";
	cin >> searchSerPref;
	cout << endl << endl;
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
//close the customer files
	cusInFile.close();
}
void readData()
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
		cout << "line: " << line << endl;
		cout << "ss: " << ss << endl;
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
void writeData()
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

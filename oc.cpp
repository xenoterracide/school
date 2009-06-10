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

	Korama is distributed in the hope that it will be useful,
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

using namespace std;

//Declare the constant variables
const double OIL_CHANGE = 19.95;
const double FULL_OIL_CHANGE = 34.95;
const double TRANS_FLUID = 109.99;
const double RADIATOR_FLUID = 69.99;
const double DIFFERENTIAL = 79.99;
const double SALES_TAX = .06;

void getCusInfo();
void getSerInfo();
void searchSerCompleted();
void searchCurrentCus();

int main()
{
	//Declare Variables
	int userChoice;
		
	//The main menu
	cout
		<< "**********************************" << endl
		<< "*    Quick Oil Change Station    *" << endl
		<< "************MAIN MENU*************" << endl
		<< "*                                *" << endl
		<< "* 1 - Add a New Customer         *" << endl
		<< "* 2 - Complete a Service         *" << endl
		<< "* 3 - Search Services            *" << endl
		<< "* 4 - Search For a Customer      *" << endl
		<< "*                                *" << endl
		<< "**********************************" << endl
		<< "Please choose the service used: ";
	cin >> userChoice;
	cout << endl;

	switch (userChoice)
	{

	case 1:
	//get the input from the user
	getCusInfo();
		break;
	
	case 2:
	//get services to be completed
	getSerInfo();
		break;

	case 3:
	searchSerCompleted();
		break;

	case 4:
	searchCurrentCus();
		break;
	}
	return 0;
}

/*
pull the system date
use a counter for each service
get a grand total for each service used
query sales and services by date ranges
*/
void getCusInfo()
{
	ofstream cusOutFile;
	//open the file to write customer information to
	cusOutFile.open("customer.txt", ios::app);

	cusOutFile << fixed << showpoint;
	cusOutFile << setprecision(2);

	string fname, lname, home, cell, work, plateNum;
	int confirm=0;
	while (confirm != 1)
	{
	cout << "First Name: ";
	cin >> fname;
	cout << "Last Name: ";
	cin >> lname;
	cout << "Home Phone: ";
	cin >> home;
	cout << "Cell Phone: ";
	cin >> cell;
	cout << "Work Phone: ";
	cin >> work;
	cout << "Plate Number: ";
	cin >> plateNum;
	cout << endl << endl;

	//output displayed to user
	cout << "Name:		" << fname << " " << lname << endl
		<< "Home Phone:	"  << home << endl
		<< "Cell Phone:	" << cell <<endl
		<< "Work Phone:	" << work << endl
		<< "Plate Number:	" << plateNum << endl
		<< endl
		<< "Is this correct?  (1=yes, 2=no)";
	cin >> confirm;
	cout << endl << endl;
	//write the data to the file
	if (confirm == 1)
	{
	cusOutFile << "Name:		" << fname << " " << lname << endl;
	cusOutFile << "Home Phone:	"  << home << endl;
	cusOutFile << "Cell Phone:	" << cell << endl;
	cusOutFile << "Work Phone:	" << work << endl;
	cusOutFile << "Plate Number:	" << plateNum << endl;
	cusOutFile << "--------------------------------" << endl;
	}
	}
	cusOutFile.close();
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

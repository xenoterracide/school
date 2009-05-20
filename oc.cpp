/*
	Copyright 2009 by Caleb Cushing <xenoterracide@gmail.com>
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
#include <fstream>
#include <iomanip>
#include <iostream>
#include <string>
#include <vector>

#include <time.h>

using namespace std;

// struct declarations
struct sales_record {
	unsigned int sale_id;
	double amount;
	unsigned int date; // purschase date
} new_sale;

struct customer_record {
	unsigned int customer_id;
	string fname;
	string lname;
} new_customer;

// record vectors ( basically tables )
vector<sales_record> sales;
vector<customer_record> customers;

//functions
int add_customer()
{
	new_customer.customer_id = customers.size();

	cout << "First Name: ";
	getline (cin, new_customer.fname, '\n');
	cout << "Last Name: ";
	getline (cin, new_customer.lname, '\n');

	customers.push_back(new_customer);
	return 0;
}

int add_sale()
{
	string opt = "\0";
	double tmp;
	vector<double> item;

	new_sale.sale_id = sales.size();

	do {
		cout << "Enter Item Price: ";
		cin >> tmp;
		item.push_back(tmp);
		cin.ignore();

		cout << "add another Item? (y/n): ";
		getline (cin, opt, '\n');
	} while (opt != "n");

	sales.push_back(new_sale);
	return 0;
}

int main()
{
	string opt = "\0";
	// read file should go here
	
	// parse menu
	while (opt != "q") {
		if (opt == "c") {
			add_customer();
			opt = "\0";
		} else if (opt == "s") {
			add_sale();
			opt = "\0";
		} else {
			cout << "new (c)ustomer new (s)ale (q)uit: ";
			getline(cin, opt, '\n');
		}
	}
	return 0;
}

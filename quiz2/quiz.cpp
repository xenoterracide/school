/* Copyright Caleb Cushing 2009. All rights reserved.
 * License: GPLv3
 */
#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;

int main()
{
	vector<int> int_list;
	bool done = false;
	int tmp = 0;
	int sum = 0;
	int product = 1; // set to 1 because a number multiplied by 1 equals itself
	int average = 0;

	// get list and read into vector
	cout << "enter a list of integers: ";
	while (done != true) {
		cin >> tmp;
		int_list.push_back(tmp);
		if (cin.peek() == '\n') {
			done = true;
		}
	}

	// print list
	cout << "Integer List: ";
	for(unsigned int i = 0; i < int_list.size(); i++) {
		cout << int_list.at(i) << ' ';
	}
	cout << endl;

	// add list
	for(unsigned int i = 0; i < int_list.size(); i++) {
		sum = sum + int_list.at(i);
	}
	cout << "Sum: " << sum << endl;

	// product
	for(unsigned int i = 0; i < int_list.size(); i++) {
		product = product * int_list.at(i);
	}
	cout << "Product: " << product << endl;

	// average
	average = sum / int_list.size();
	cout << "Average: " << average << endl;

	// sort for min max that way min is the first element and max is the last
	sort(int_list.begin(), int_list.end());
	cout << "Min: " << int_list.front() << endl;
	cout << "Max: " << int_list.back() << endl;

	// print list
	cout << "Integer List: ";
	for(unsigned int i = 0; i < int_list.size(); i++) {
		cout << int_list.at(i) << ' ';
	}
	cout << endl;
	return 0;
}

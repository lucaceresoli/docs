#include <string>
#include <list>
#include <iostream>

using std::string;
using std::list;
using std::cout;
using std::endl;

struct Item {
	string name;
	int    price;
};

int main() {
	list<Item> cart1, cart2;
	Item kr = {"The C Programming Language", 53};
	Item bs = {"The C++ Programming Language", 56};
	Item bc = {"Understanding the Linux Kernel", 45};
	cart1.push_back(kr);
	cart1.push_back(bs);
	cart2.push_back(kr);
	cart2.push_back(bc);
	int total1 = 0, total2 = 0;
	for (Item &i: cart1)
		total1 += i.price;
	for (Item &i: cart2)
		total2 += i.price;
	cout << "Cart1 total: " << total1 << endl;
	cout << "Cart2 total: " << total2 << endl;
}

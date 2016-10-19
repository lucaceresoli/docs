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

class ShoppingCart {
public:
	void   add(Item &item);
	int    getTotal();
private:
	list<Item> items;
};

void ShoppingCart::add(Item &item) {
	items.push_back(item);
}

int ShoppingCart::getTotal() {
	int total = 0;
	for (Item &i: items)
		total += i.price;
	return total;
}

int main()
{
	ShoppingCart cart1, cart2;
	Item kr = {"The C Programming Language", 53};
	Item bs = {"The C++ Programming Language", 56};
	Item bc = {"Understanding the Linux Kernel", 45};
	cart1.add(kr);
	cart1.add(bs);
	cart2.add(kr);
	cart2.add(bc);
	cout << "Cart1 total: " << cart1.getTotal() << endl;
	cout << "Cart2 total: " << cart2.getTotal() << endl;
}

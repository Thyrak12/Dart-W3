class Address {
  final String houseNo;
  final String street;
  final int zipCode;

  Address(this.houseNo, this.street, this.zipCode);
}

class Product {
  final String _name;
  final double _price;

  Product(this._name, this._price);

  String get productName => this._name;
  double get getPrice => this._price;

  @override
  String toString() {
    return "$_name (\$$_price)";
  }
}

class OrderItem {
  final Product _product;
  final int _qty;

  OrderItem(this._product, this._qty);

  int get itemTotal => this._qty;

  @override
  String toString() {
    return "$_qty x $_product = \$${_qty * _product.getPrice}";
  }
}

class Order {
  final List<OrderItem> items;
  bool isPickUp;
  Address? address;

  Order({required this.items, required this.isPickUp, this.address});

  void addItems(OrderItem item) {
    this.items.add(item);
  }

  double getTotalPrice() {
    double sum = 0;
    for (OrderItem item in items) {
      sum += (item.itemTotal * item._product.getPrice);
    }
    return sum;
  }

  @override
  String toString() {
    String orderType = isPickUp ? "Pick up" : "Delivery to $address";
    String itemList = items.map((item) => item.toString()).join("\n");
    return "Order type: $orderType\nItems:\n$itemList\nTotal: \$${getTotalPrice()}";
  }
}

void main() {
  Product product1 = Product("Laptop", 1200.0);
  Product product2 = Product("Mouse", 25.0);
  Product product3 = Product("Keyboard", 45.0);

  OrderItem item1 = OrderItem(product1, 1); // 1 Laptop
  OrderItem item2 = OrderItem(product2, 2); // 2 Mice
  OrderItem item3 = OrderItem(product3, 1); // 1 Keyboard

  Address address = Address("123", "Main Street", 54321);

  Order order = Order(items: [item1, item2], isPickUp: false, address: address);
  order.addItems(item3);

  print(order);
}

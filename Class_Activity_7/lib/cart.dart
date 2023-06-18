import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<String> _items = [];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Column(
      children: [
        const Text('Cart', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            final item = cart.items[index];
            return ListTile(
              title: Text(item),
              trailing: IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => cart.removeItem(item),
              ),
            );
          },
        ),
        ElevatedButton(
          onPressed: cart.clearCart,
          child: const Text('Clear Cart'),
        ),
      ],
    );
  }
}

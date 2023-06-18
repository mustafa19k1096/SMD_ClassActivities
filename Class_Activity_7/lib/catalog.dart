import 'package:flutter/material.dart';

class Catalog extends ChangeNotifier {
  List<String> _items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }
}

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final catalog = Provider.of<Catalog>(context);

    return Column(
      children: [
        const Text('Catalog', style: TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          itemCount: catalog.items.length,
          itemBuilder: (context, index) {
            final item = catalog.items[index];
            return ListTile(title: Text(item));
          },
        ),
      ],
    );
  }
}

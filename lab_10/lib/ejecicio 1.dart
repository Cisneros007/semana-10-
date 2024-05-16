import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ListItem {
  final String category;
  final String name;
  final String imageUrl;

  ListItem({required this.category, required this.name, required this.imageUrl});
}

class MyApp extends StatelessWidget {
  final List<ListItem> items = [
    ListItem(category: 'Alimentos', name: 'Manzana', imageUrl: 'assets/images/manzana.png'),
    ListItem(category: 'Animales', name: 'Gato', imageUrl: 'assets/images/gato.png'),
    ListItem(category: 'Lugares', name: 'Montaña', imageUrl: 'assets/images/montaña.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista con Imágenes y Fuentes'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.asset(items[index].imageUrl),
              title: Text(
                items[index].name,
                style: TextStyle(
                  fontFamily: _getFontFamily(items[index].category),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String _getFontFamily(String category) {
    switch (category) {
      case 'Alimentos':
        return 'Open Sans';
      case 'Animales':
        return 'Lato';
      case 'Lugares':
        return 'Ubuntu';
      default:
        return '';
    }
  }
}

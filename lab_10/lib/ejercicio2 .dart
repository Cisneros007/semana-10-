import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ProductDetails extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  ProductDetails({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                imageUrl,
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$$price',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductDetails(
        name: 'Reloj de pared',
        imageUrl: 'assets/images/reloj.png',
        price: 26.99,
        description:
            'Máquina que sirve para medir el tiempo o dividir el día en horas, minutos y segundos y que se coloca en la pared..',
      ),
    );
  }
}

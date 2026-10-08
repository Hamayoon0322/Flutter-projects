import 'package:flutter/material.dart';
import 'lab_output.dart';

class Product {
  final String name;
  final double price;
  final String category;
  const Product({
    required this.name,
    required this.price,
    this.category = 'General',
  });
  const Product.free({required this.name, this.category = 'General'})
    : price = 0;
  @override
  String toString() =>
      '$name | Price: \$${price.toStringAsFixed(2)} | Category: $category';
}

List<String> runLab4() {
  final notebook = Product(name: 'Notebook', price: 3.50);
  final keyboard = Product(
    name: 'Keyboard',
    price: 25,
    category: 'Electronics',
  );
  final gift = Product.free(name: 'Welcome gift');
  final output = ['$notebook', '$keyboard', '$gift'];
  for (final information in output) {
    debugPrint(information);
  }
  return output;
}

class Lab4Page extends StatelessWidget {
  const Lab4Page({super.key});
  @override
  Widget build(BuildContext context) =>
      LabOutput(title: 'Lab 4 - Parameters & Constructors', lines: runLab4());
}

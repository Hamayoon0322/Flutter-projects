import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
  });

  final String id;
  final String name;
  final double price;
}

const _products = <Product>[
  Product(id: 'P-101', name: 'Wireless Headphones', price: 79.99),
  Product(id: 'P-102', name: 'Campus Backpack', price: 54.50),
  Product(id: 'P-103', name: 'Study Lamp', price: 32.25),
];

class Lab2ProductListPage extends StatelessWidget {
  const Lab2ProductListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 2 - Products')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('Choose a product to pass its typed data to details.'),
        const SizedBox(height: 8),
        for (final product in _products)
          Card(
            child: ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push<void>(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => Lab2ProductDetailsPage(product: product),
                ),
              ),
            ),
          ),
      ],
    ),
  );
}

class Lab2ProductDetailsPage extends StatelessWidget {
  const Lab2ProductDetailsPage({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Lab 2 - Product Details')),
    body: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.name, style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 16),
          _ProductValue(label: 'Product ID', value: product.id),
          _ProductValue(
            label: 'Price',
            value: '\$${product.price.toStringAsFixed(2)}',
          ),
          const SizedBox(height: 16),
          const Text(
            'Typed, required constructor parameters make the data contract '
            'clear and catch missing or incorrect values at compile time.',
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to products'),
            ),
          ),
        ],
      ),
    ),
  );
}

class _ProductValue extends StatelessWidget {
  const _ProductValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Text('$label: $value'),
  );
}

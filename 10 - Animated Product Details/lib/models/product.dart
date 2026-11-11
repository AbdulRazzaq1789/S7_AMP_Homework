import 'package:flutter/material.dart';

class Product {
  const Product({required this.id, required this.name, required this.subtitle,
      required this.price, required this.image, required this.color});
  final String id;
  final String name;
  final String subtitle;
  final String price;
  final String image;
  final Color color;
}

const products = [
  Product(id: 'violet', name: 'Studio One', subtitle: 'Wireless noise-cancelling headphones',
      price: 'AFN 4,900', image: 'assets/images/headphones.png', color: Color(0xFFEAE9FF)),
  Product(id: 'rose', name: 'Studio Rose', subtitle: 'Wireless headphones • special edition',
      price: 'AFN 5,200', image: 'assets/images/headphones_rose.png', color: Color(0xFFFFE8EE)),
];

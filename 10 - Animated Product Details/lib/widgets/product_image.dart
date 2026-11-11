import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.product, this.height = 270});
  final Product product;
  final double height;

  @override
  Widget build(BuildContext context) => Hero(
        tag: 'product-${product.id}',
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(26),
            ),
            child: Image.asset(product.image, fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Center(
                      child: Icon(Icons.headphones, size: 90),
                    )),
          ),
        ),
      );
}

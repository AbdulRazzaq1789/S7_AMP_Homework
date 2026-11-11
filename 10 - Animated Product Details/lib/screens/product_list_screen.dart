import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_image.dart';
import 'animated_product_details.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Featured products')),
    body: SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text('Find your sound',
                style: Theme.of(context).textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              const Text('Choose a product to explore Flutter animations.'),
              const SizedBox(height: 22),
              for (final product in products)
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      key: Key('open_product_${product.id}'),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => AnimatedProductDetails(product: product),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(children: [
                          SizedBox(width: 100,
                            child: ProductImage(product: product, height: 100)),
                          const SizedBox(width: 14),
                          Expanded(child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.name,
                                style: const TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.w800)),
                              const SizedBox(height: 5),
                              Text(product.subtitle,
                                maxLines: 2, overflow: TextOverflow.ellipsis),
                              const SizedBox(height: 8),
                              Text(product.price,
                                style: TextStyle(fontWeight: FontWeight.w800,
                                    color: Theme.of(context).colorScheme.primary)),
                            ],
                          )),
                          const Icon(Icons.chevron_right_rounded),
                        ]),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

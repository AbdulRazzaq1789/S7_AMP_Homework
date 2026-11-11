import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/additional_information.dart';
import '../widgets/favorite_button.dart';
import '../widgets/product_image.dart';
import '../widgets/specifications_panel.dart';
import '../widgets/staggered_entrance.dart';

class AnimatedProductDetails extends StatefulWidget {
  const AnimatedProductDetails({super.key, required this.product});
  final Product product;
  @override
  State<AnimatedProductDetails> createState() => _AnimatedProductDetailsState();
}

class _AnimatedProductDetailsState extends State<AnimatedProductDetails>
    with SingleTickerProviderStateMixin {
  late final AnimationController _entrance;

  @override
  void initState() {
    super.initState();
    _entrance = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1300),
    )..forward();
  }

  @override
  void dispose() {
    _entrance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Product details')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 34),
              children: [
                StaggeredEntrance(
                  controller: _entrance, begin: 0, end: .35,
                  child: ProductImage(product: product),
                ),
                const SizedBox(height: 24),
                StaggeredEntrance(
                  controller: _entrance, begin: .16, end: .52,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name, style: theme.textTheme.headlineMedium
                              ?.copyWith(fontWeight: FontWeight.w800)),
                          const SizedBox(height: 5),
                          Text(product.subtitle, style: theme.textTheme.bodyLarge),
                        ],
                      )),
                      const FavoriteButton(),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                StaggeredEntrance(
                  controller: _entrance, begin: .32, end: .7,
                  child: Row(children: [
                    Text(product.price, style: theme.textTheme.headlineSmall
                        ?.copyWith(color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w800)),
                    const Spacer(),
                    const Chip(label: Text('In stock'),
                        avatar: Icon(Icons.check_circle_outline, size: 17)),
                  ]),
                ),
                const SizedBox(height: 20),
                const SpecificationsPanel(),
                const SizedBox(height: 14),
                const AdditionalInformation(),
                const SizedBox(height: 20),
                StaggeredEntrance(
                  controller: _entrance, begin: .6, end: 1,
                  child: FilledButton.icon(
                    key: const Key('add_to_cart_button'),
                    onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.name} added to demo cart')),
                    ),
                    icon: const Icon(Icons.shopping_bag_outlined),
                    label: const Text('Add to cart'),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton.icon(
                  onPressed: () => _entrance.forward(from: 0),
                  icon: const Icon(Icons.replay_rounded),
                  label: const Text('Replay entrance animation'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/product_list_screen.dart';
import 'theme/app_theme.dart';

class AnimatedProductsApp extends StatelessWidget {
  const AnimatedProductsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Animated Product Details',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        home: const ProductListScreen(),
      );
}

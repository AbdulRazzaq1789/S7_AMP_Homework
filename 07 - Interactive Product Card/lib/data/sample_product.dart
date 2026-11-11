import '../models/product.dart';

/// Entirely fictional product data, available offline.
const Product sampleProduct = Product(
  id: 'audio-01',
  name: 'Forma One',
  tagline: 'Sound in its purest form.',
  category: 'WIRELESS OVER-EAR HEADPHONES',
  price: 249,
  previousPrice: 299,
  rating: 4.9,
  reviews: 1284,
  description:
      'Thoughtful details, better listening. Soft over-ear cushions, balanced '
      'sound and all-day comfort give this design a quieter kind of confidence.',
  assetPath: 'assets/images/headphones.png',
  features: <String>['40h battery', 'Spatial sound', 'Noise canceling'],
);

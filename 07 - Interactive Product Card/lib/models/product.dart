/// Immutable sample product displayed in the interactive card.
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.category,
    required this.price,
    required this.previousPrice,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.assetPath,
    required this.features,
  });

  final String id;
  final String name;
  final String tagline;
  final String category;
  final double price;
  final double previousPrice;
  final double rating;
  final int reviews;
  final String description;
  final String assetPath;
  final List<String> features;
}

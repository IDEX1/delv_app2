class FoodItem {
  final String id;
  final String name;
  final String imageUrl;
  final String ratingPercent; // For HomePage card
  final String description;
  final double price;
  final double ratingValue; // For DetailPage/Favorites stars/number
  final int reviewCount;
  final List<String> ingredients;
  final int? durationMinutes; // <-- ADDED Optional duration in minutes

  const FoodItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.ratingPercent,
    required this.description,
    required this.price,
    required this.ratingValue,
    required this.reviewCount,
    required this.ingredients,
    this.durationMinutes, // <-- ADDED
  });
}
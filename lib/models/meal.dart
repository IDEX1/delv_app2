class Meal {
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final String time;
  final String? comment;

  Meal({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.time,
    this.comment,
  });
}

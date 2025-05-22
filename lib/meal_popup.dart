import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MealPopup extends StatelessWidget {
  final Meal meal;

  const MealPopup({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(meal.name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(meal.imageUrl),
          const SizedBox(height: 10),
          const Text("Notez ce repas :"),
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder:
                (context, _) => const Icon(Icons.star, color: Colors.amber),
            onRatingUpdate: (rating) {
              print("Note: $rating");
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Fermer"),
        ),
      ],
    );
  }
}

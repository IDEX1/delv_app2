import 'package:flutter/material.dart'; // For Icons
import '../models/category.dart';
import '../models/food_item.dart';

// --- Dummy Data ---
const List<Category> dummyCategories = [
  Category(name: 'Salade', icon: Icons.eco_outlined),
  Category(name: 'Dessert', icon: Icons.icecream_outlined),
  Category(name: 'Vegetables', icon: Icons.grass),
  Category(name: 'Sea Food', icon: Icons.set_meal),
  Category(name: 'Drinks', icon: Icons.local_bar_outlined),
  Category(name: 'Soups', icon: Icons.soup_kitchen_outlined),
];
final List<FoodItem> dummyFoodItems = [
  FoodItem(
    id: 'f1',
    name: 'Avocado Salad',
    imageUrl:
        'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZnJlc2glMjBzYWxhZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ratingPercent: '89%',
    description:
        'Fresh and zesty avocado salad with cherry tomatoes, cucumber, red onion, and a light vinaigrette. Perfect for a healthy lunch.',
    price: 12.99,
    ratingValue: 4.5,
    reviewCount: 0,
    ingredients: [
      // <-- ADDED
      'Avocados',
      'Cherry Tomatoes',
      'Cucumber',
      'Red Onion',
      'Cilantro',
      'Lime Juice',
      'Olive Oil',
      'Salt & Pepper',
    ],
  ),
  FoodItem(
    id: 'f2',
    name: 'Grilled Chicken Bowl',
    imageUrl:
        'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Zm9vZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ratingPercent: '92%',
    description:
        'A hearty bowl with grilled chicken breast, quinoa, roasted vegetables, and a tangy sauce.',
    price: 15.50,
    ratingValue: 4.7,
    reviewCount: 0,
    ingredients: [
      // <-- ADDED
      'Chicken Breast',
      'Quinoa',
      'Broccoli',
      'Bell Peppers',
      'Sweet Potatoes',
      'Olive Oil',
      'Lemon Tahini Dressing',
    ],
  ),
  FoodItem(
    id: 'f3',
    name: 'Berry Smoothie',
    imageUrl:
        'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Zm9vZHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60',
    ratingPercent: '85%',
    description:
        'Refreshing smoothie packed with mixed berries, yogurt, and a hint of honey.',
    price: 7.00,
    ratingValue: 4.3,
    reviewCount: 0,
    ingredients: [
      // <-- ADDED
      'Mixed Berries (Frozen)',
      'Greek Yogurt',
      'Almond Milk',
      'Banana (Optional)',
      'Honey or Maple Syrup',
    ],
  ),
  FoodItem(
    id: 'f4',
    name: 'Vegetable Stir-fry',
    imageUrl:
        'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    ratingPercent: '88%',
    description:
        'Colorful mix of fresh vegetables stir-fried in a savory soy-ginger sauce, served with rice.',
    price: 11.50,
    ratingValue: 4.4,
    reviewCount: 0,
    ingredients: [
      // <-- ADDED
      'Broccoli Florets',
      'Carrots',
      'Snap Peas',
      'Bell Peppers',
      'Mushrooms',
      'Soy Sauce',
      'Ginger',
      'Garlic',
      'Sesame Oil',
      'Cooked Rice',
    ],
  ),
  FoodItem(
    id: 'f5',
    name: 'Breakfast Toast',
    imageUrl:
        'https://images.unsplash.com/photo-1484723091739-30a097e8f929?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    ratingPercent: '90%',
    description:
        'Toasted sourdough topped with avocado, poached egg, and chili flakes. A perfect start to your day.',
    price: 9.75,
    ratingValue: 4.6,
    reviewCount: 0,
    ingredients: [
      // <-- ADDED
      'Sourdough Bread Slice',
      'Avocado',
      'Egg',
      'Olive Oil',
      'Chili Flakes',
      'Salt & Pepper',
    ],
  ),
  FoodItem(
    id: 'f6',
    name: 'Pasta Primavera',
    imageUrl:
'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGZvb2R8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60',
    ratingPercent: '87%',
    description:
        'Classic pasta dish with spring vegetables in a light cream sauce.',
    price: 14.00,
    ratingValue: 4.3,
    reviewCount: 0,
    ingredients: [
      // <-- ADDED
      'Pasta (e.g., Fettuccine)',
      'Asparagus',
      'Peas',
      'Zucchini',
      'Cherry Tomatoes',
      'Garlic',
      'Heavy Cream',
      'Parmesan Cheese',
      'Olive Oil',
      'Fresh Basil',
    ],
  ),
];

// Create a separate list for favorites (can be a subset or different items)
// For simplicity, let's just reuse some from dummyFoodItems
// In a real app, this would be managed based on user actions (liking)
List<FoodItem> dummyFavorites = [
  dummyFoodItems[0], // Avocado Salad
  dummyFoodItems[3], // Stir-fry
  dummyFoodItems[1], // Chicken Bowl
  dummyFoodItems[5], // Pasta
  dummyFoodItems[4], // Toast
  dummyFoodItems[0].copyWith(
    id: 'f1_copy',
  ), // Add duplicates to test scroll/dismiss
  dummyFoodItems[3].copyWith(id: 'f4_copy'),
];

// Helper extension to easily copy FoodItem with changes (useful for unique IDs)
extension FoodItemCopyWith on FoodItem {
  FoodItem copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? ratingPercent,
    String? description,
    double? price,
    double? ratingValue,
    int? reviewCount,
    List<String>? ingredients,
    int? durationMinutes,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      ratingPercent: ratingPercent ?? this.ratingPercent,
      description: description ?? this.description,
      price: price ?? this.price,
      ratingValue: ratingValue ?? this.ratingValue,
      reviewCount: reviewCount ?? this.reviewCount,
      ingredients: ingredients ?? this.ingredients,
      durationMinutes: durationMinutes ?? this.durationMinutes,
    );
  }
}
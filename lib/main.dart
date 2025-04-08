import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import './libaryneed/my_flutter_app_icons.dart';
void main() {
  runApp(const FavouritesApp());
}

class FavouritesApp extends StatelessWidget {
  const FavouritesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favourites Page',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F1E8),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const FavouritesPage(),
    );
  }
}

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
 

 

  static const IconData arrow_circle_left_outlined = IconData(0xf05bc, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E8), // Light background color
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F1E8),
        elevation: 0,
        leading: IconButton(
          icon: InnerShadow(
            shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: const Offset(2, 2),
              blurRadius: 4,
            ),
          ],
          child: const Icon(arrow_circle_left_outlined, color : Color(0xFFB9E7AD),size: 42.0,),
          ),
          
          onPressed: () {
            // back home
          },
        ),
        centerTitle: false,
        title: InnerShadow(
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              offset: const Offset(2, 2),
              blurRadius: 4,
            ),
          ],
          child: const Text(
            'Favourites',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB9E7AD),
            ),
          ),
        ),
),
      body: Column(
        children: [
          
          SizedBox(
            height: 60,
            child: CategorySelector(),
          ),
        
        ],
      ),
      
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ActionChip(
        label: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: active ? const Color(0xFFB9E7AD) : const Color(0xFFF5F1E8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color:  Colors.grey,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String selectedCategory = 'Salade';

  final List<String> categories = ['Salade', 'Dessert', 'Vegetables', 'Sea food'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return CategoryChip(
            label: category,
            active: selectedCategory == category,
            onTap: () {
              setState(() {
                selectedCategory = category;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}



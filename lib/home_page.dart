import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../data/dummy_data.dart'; 
import '../utils/app_colors.dart';   
import './food_detail_page.dart';  

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

 

  
  void _navigateToDetail(BuildContext context, FoodItem item) {
    
    
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailPage(foodItem: item),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // We use body for everything including the top bar as it's not a standard AppBar
      body: SafeArea( // Ensures content isn't hidden by notches or status bar
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // --- Top Row: Logo and Welcome ---
                 Row(
                  children: [
                    // Logo Placeholder
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300]?.withOpacity(0.5), // Placeholder color
                        border: Border.all(color: kPrimaryGreen, width: 1.5),
                         image: const DecorationImage(
                        image: AssetImage('assets/profil.png'),
                        fit: BoxFit.cover,
                      ),
                      ),
                      // child: const Icon(Icons.restaurant_menu, color: kPrimaryGreen, size: 28),
                    ),
                    const SizedBox(width: 12),
                    // Welcome Text - Use theme
                    Text(
                      'Welcome!', // Simplified
                      style: textTheme.headlineSmall,
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                
                _buildSearchBar(context),
                const SizedBox(height: 24),

                
                Text('Categories', style: textTheme.titleLarge?.copyWith(color: kTextColor, fontSize: 18)),
                const SizedBox(height: 12),
                _buildCategories(context),
                const SizedBox(height: 24),

                
                _buildFoodGrid(context),
                const SizedBox(height: 80), // Add space at the bottom so content doesn't hide behind nav bar
              ],
            ),
          ),
        ),
      ),
      
      
    );
  }

  

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSearchBarColor,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: kBorderColor, width: 1.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'search for dish',
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: kSubtleTextColor),
          prefixIcon: const Icon(Icons.search, color: kPrimaryGreen, size: 24),
          border: InputBorder.none, // Remove default border
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        onChanged: (value) {
          // Handle search logic
          print('Search query: $value');
        },
      ),
    );
  }

  Widget _buildCategories(BuildContext context) {
    return SizedBox(
      height: 90, // Adjust height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        // Use dummyCategories list from imported data file
        itemCount: dummyCategories.length,
        itemBuilder: (context, index) {
          final category = dummyCategories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 20.0), // Spacing between categories
            child: InkWell(
              onTap: () {
                // Handle category tap
                print('Tapped category: ${category.name}');
              },
              borderRadius: BorderRadius.circular(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(category.icon, color: kIconColor, size: 30),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    category.name,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: kTextColor),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFoodGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Important inside SingleChildScrollView
      physics: const NeverScrollableScrollPhysics(), // Disable grid's own scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two columns
        crossAxisSpacing: 16.0, // Horizontal spacing
        mainAxisSpacing: 16.0, // Vertical spacing
        childAspectRatio: 0.68, // Adjust ratio (width / height) to fit content
      ),
      // Use dummyFoodItems list from imported data file
      itemCount: dummyFoodItems.length,
      itemBuilder: (context, index) {
        final item = dummyFoodItems[index];
        // Pass item and context to the card builder
        return _buildFoodItemCard(context, item);
      },
    );
  }

  Widget _buildFoodItemCard(BuildContext context, FoodItem item) {
     final textTheme = Theme.of(context).textTheme;
     // Wrap with GestureDetector for Tapping
     return GestureDetector(
       onTap: () => _navigateToDetail(context, item), // Navigate on tap
       child: Container(
         decoration: BoxDecoration(
           color: Theme.of(context).colorScheme.surface, // Use surface color from theme
           borderRadius: BorderRadius.circular(15.0),
           border: Border.all(color: kBorderColor, width: 1.0),
           boxShadow: [
             BoxShadow(
               color: Colors.grey.withOpacity(0.1),
               spreadRadius: 1,
               blurRadius: 3,
               offset: const Offset(0, 2),
             ),
           ],
         ),
         child: ClipRRect( // Clip content like image to rounded corners
           borderRadius: BorderRadius.circular(14.0), // Slightly less than container
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch image
             children: [
               // --- Image ---
               Expanded(
                 child: Image.network(
                   item.imageUrl,
                   fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Center(
                       child: Icon(Icons.fastfood_outlined, size: 40, color: Colors.grey)
                   ),
                    loadingBuilder: (context, child, loadingProgress) {
                     if (loadingProgress == null) return child;
                     return Center(
                       child: CircularProgressIndicator(
                         value: loadingProgress.expectedTotalBytes != null
                             ? loadingProgress.cumulativeBytesLoaded /
                                 loadingProgress.expectedTotalBytes!
                             : null,
                         strokeWidth: 2,
                         color: kPrimaryGreen,
                       ),
                     );
                   },
                 ),
               ),
               // --- Details Below Image ---
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     // --- Name ---
                     Text(
                       item.name,
                       style: textTheme.titleMedium?.copyWith(fontSize: 15),
                       maxLines: 1,
                       overflow: TextOverflow.ellipsis,
                     ),
                     const SizedBox(height: 8),
                     // --- Actions Row ---
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         // Add Button
                         InkWell( // Make button tappable separately if needed
                           onTap: () {
                              print('Add ${item.name} from card');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${item.name} added (simulation)'),
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: kPrimaryGreen,
                                ),
                              );
                           },
                           child: Container(
                             padding: const EdgeInsets.all(6),
                             decoration: BoxDecoration(
                               shape: BoxShape.rectangle, // Make it rectangular
                                borderRadius: BorderRadius.circular(8),
                               border: Border.all(color: kPrimaryGreen, width: 1.5),
                             ),
                             child: const Icon(Icons.add, color: kPrimaryGreen, size: 20),
                           ),
                         ),

                         // Like Button / Indicator
                         InkWell( // Make button tappable separately if needed
                            onTap: () => print('Like ${item.name} from card'),
                            child: Container(
                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: kPrimaryYellow, width: 1.5),
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.thumb_up_alt_outlined, color: kPrimaryYellow, size: 18),
                                  const SizedBox(width: 4),
                                  Text(
                                    item.ratingPercent, // Use rating % from item
                                    style: textTheme.bodySmall?.copyWith(color: kPrimaryYellow, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
     );
  }



}
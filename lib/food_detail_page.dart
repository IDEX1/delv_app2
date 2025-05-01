import 'package:flutter/material.dart';
import '../models/food_item.dart';
import '../utils/app_colors.dart';
import './comments_page.dart'; // <-- Import the new CommentsPage

// ... (Keep RatingBar class and other imports)

class FoodDetailPage extends StatefulWidget {
  final FoodItem foodItem;
  const FoodDetailPage({super.key, required this.foodItem});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  bool _isLiked = false;
  bool _isLfavorite = false;
  double _userRating = 0.0;

  @override
  void initState() {
    super.initState();
    _userRating = widget.foodItem.ratingValue;
  }

  @override
  void dispose() {
    // _commentController.dispose(); // REMOVED
    super.dispose();
  }

  void _toggleLike() {
    // ... (keep this function as is)
    setState(() {
      _isLiked = !_isLiked;
    });
    print("Like status changed for ${widget.foodItem.name}: $_isLiked");
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isLiked ? '${widget.foodItem.name} Liked!' : '${widget.foodItem.name} Unliked.'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
  void _favorite() {
    // ... (keep this function as is)
    setState(() {
      _isLfavorite = !_isLfavorite;
    });
    print("favorite status changed for ${widget.foodItem.name}: $_isLfavorite");
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_isLfavorite ? '${widget.foodItem.name} favorite!' : '${widget.foodItem.name} no favorite.'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // void _addComment() { ... } // REMOVED

  void _updateRating(double newRating) {
     // ... (keep this function as is)
     setState(() {
      _userRating = newRating;
    });
    print("User submitted rating for ${widget.foodItem.name}: $newRating");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You rated this ${newRating.toStringAsFixed(1)} stars!'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _addToCart() {
     // ... (keep this function as is)
     print("Add to cart pressed for ${widget.foodItem.name}");
     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text('${widget.foodItem.name} added to cart! (Simulation)'),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  // --- ADDED Navigation Function ---
  void _navigateToComments(BuildContext context) {
     Navigator.push(
      context,
      MaterialPageRoute(
        // Pass necessary data if needed in the future, e.g., widget.foodItem.id
        builder: (context) => const CommentsPage(),
      ),
    );
  }
  // --- End ADDED ---


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.foodItem.name),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      // extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // ... (Background shapes remain the same)
          Positioned(
            right: -80,
            bottom: 110,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: kPrimaryYellow.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: -70,
            top: 240,
            child: Container(
              width: 240,
              height: 240,
              decoration: BoxDecoration(
                color: kPrimaryGreen.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            bottom: false,
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only( left: 16, right: 16, bottom: 16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        _buildRecipeImage(context, widget.foodItem.imageUrl),
                        const SizedBox(height: 24),
                        Text(widget.foodItem.name, style: textTheme.headlineSmall?.copyWith(color: kTextColor)),
                        const SizedBox(height: 12),
                        _buildRatingSection(context, colorScheme, widget.foodItem.reviewCount),

                        // --- ADDED Link to Comments Page ---
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () => _navigateToComments(context),
                            child: Text(
                              'View Comments (${widget.foodItem.reviewCount})', // Example text
                              style: textTheme.bodySmall?.copyWith(
                                color: kPrimaryGreen,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: kPrimaryGreen.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ),
                        // --- End ADDED ---

                        const SizedBox(height: 10), // Adjusted spacing
                        Text(widget.foodItem.description, style: textTheme.bodyMedium?.copyWith(height: 1.4, color: kSubtleTextColor)),
                        const SizedBox(height: 24),
                        _buildIngredientsSection(context, textTheme, colorScheme,widget.foodItem.ingredients),
                        const SizedBox(height: 24),
                        // _buildActionButtons(context, colorScheme),
                        // const SizedBox(height: 24),
                        // const SizedBox(height: 10), // Adjusted spacing
                        // Text(widget.foodItem.description, style: textTheme.bodyMedium?.copyWith(height: 1.4, color: kSubtleTextColor)),
                        // const SizedBox(height: 24),

                        // Pass the specific food item's ingredients to the helper
                        // _buildIngredientsSection(context, textTheme, colorScheme, widget.foodItem.ingredients), // <-- MODIFIED CALL

                        const SizedBox(height: 24),
                        _buildActionButtons(context, colorScheme),
                        const SizedBox(height: 40),
                        // _buildCommentInput(context, colorScheme), // REMOVED
                        // const SizedBox(height: 24),               // REMOVED
                        // _buildCommentsList(context, textTheme, colorScheme), // REMOVED

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Helper Widgets ---
  // _buildRecipeImage, _buildRatingSection, _buildIngredientsSection, _buildActionButtons remain the same
  // REMOVE _buildCommentInput and _buildCommentsList helper methods from here

 Widget _buildIngredientsSection(
      BuildContext context,
      TextTheme textTheme,
      ColorScheme colorScheme,
      List<String> ingredients // <-- ACCEPT LIST HERE
      ) {

    // Handle case where ingredients might be empty
    if (ingredients.isEmpty) {
      return const SizedBox.shrink(); // Don't display anything if no ingredients
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            'Ingredients',
            style: textTheme.titleLarge?.copyWith(color: kTextColor),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surface.withOpacity(0.6),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: kBorderColor,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Use the passed ingredients list
            children: ingredients.map((ingredient) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: _buildIngredientItem(ingredient, textTheme),
            )).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildIngredientItem(String ingredient, TextTheme textTheme) {
     // ... (Implementation remains the same) ...
     return Row(
      children: [
        Icon(Icons.circle, size: 8, color: kSubtleTextColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            ingredient,
            style: textTheme.bodyMedium?.copyWith(color: kTextColor),
          ),
        ),
      ],
    );
  }

  Widget _buildRecipeImage(BuildContext context, String imageUrl) {
    // ... (keep implementation)
     return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.network(
            imageUrl, // Use passed image URL
            height: 280,
            width: double.infinity,
            fit: BoxFit.cover,
             loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return Container(
                height: 280,
                width: double.infinity,
                color: Colors.grey[200],
                child: Center(
                  child: CircularProgressIndicator(
                    value: progress.expectedTotalBytes != null
                        ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes!
                        : null,
                     strokeWidth: 2,
                     color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 280,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100, // Lighter error background
                  borderRadius: BorderRadius.circular(16) // Match ClipRRect
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image_outlined, size: 60, color: Colors.grey.shade400),
                      const SizedBox(height: 8),
                      Text(
                        'Image unavailable',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          // Optional Watermark/Icon for image
    
          // Optional Heart Icon for favorites
          Positioned(
            top: 13,
            left: 6,
            height: 40,
            width: 40,
            child: IconButton(
              icon: Icon(
                _isLfavorite ? Icons.favorite : Icons.favorite_border,
                color: _isLfavorite ? Colors.red : Colors.white,
                size: 30,
              ),
              onPressed: _favorite, // Toggle like status
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRatingSection(BuildContext context, ColorScheme colorScheme, int reviewCount) {
    // ... (keep implementation)
    return Row(
      children: [
        Text(
          _userRating.toStringAsFixed(1), // Display current user rating state
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: kTextColor, // Use text color
          ),
        ),
        const SizedBox(width: 8),
        RatingBar(
          initialRating: _userRating, // Use current user rating state
          onRatingUpdate: _updateRating, // Pass the state update function
          starColor: kStarColor, // Use specific star color
          size: 22,
        ),
         const Spacer(), // Pushes rating to the left
        // Moved the count text to the new TextButton below
      ],
    );
  }

  // Widget _buildIngredientsSection(BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
  //   // ... (keep implementation)
  //    final ingredients = [
  //     'Avocados',
  //     'Cucumber',
  //     'Grape Tomatoes',
  //     'Red onion',
  //     'Cilantro',
  //     'Lime Juice', // Example addition
  //     'Olive Oil',   // Example addition
  //   ];

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Padding(
  //         padding: const EdgeInsets.only(left: 4.0), // Slight indent for title
  //         child: Text(
  //           'Ingredients', // Simpler title
  //           style: textTheme.titleLarge?.copyWith(color: kTextColor),
  //         ),
  //       ),
  //       const SizedBox(height: 12),
  //       Container(
  //         width: double.infinity,
  //         padding: const EdgeInsets.all(16),
  //         decoration: BoxDecoration(
  //           color: colorScheme.surface.withOpacity(0.6), // Slight opacity
  //           borderRadius: BorderRadius.circular(16),
  //           border: Border.all(
  //             color: kBorderColor, // Use border color from theme
  //             width: 1,
  //           ),
  //         ),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: ingredients.map((ingredient) => Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 4.0),
  //             child: _buildIngredientItem(ingredient, textTheme),
  //           )).toList(),

  //         ),
  //       ),
  //     ],
  //   );
  // }

  //   Widget _buildIngredientItem(String ingredient, TextTheme textTheme) {
  //     // ... (keep implementation)
  //      return Row(
  //     children: [
  //       Icon(Icons.circle, size: 8, color: kSubtleTextColor), // Use subtle color
  //       const SizedBox(width: 12),
  //       Expanded( // Allow text to wrap if ingredient name is long
  //         child: Text(
  //           ingredient,
  //           style: textTheme.bodyMedium?.copyWith(color: kTextColor), // Use text color
  //         ),
  //       ),
  //     ],
  //   );
  // }


  Widget _buildActionButtons(BuildContext context, ColorScheme colorScheme) {
    // ... (keep implementation)
      return Row(
      children: [
        OutlinedButton(
          onPressed: _toggleLike,
          style: OutlinedButton.styleFrom(
             padding: const EdgeInsets.all(10),
             minimumSize: const Size(44, 44),
             side: BorderSide(color: _isLiked ? colorScheme.primary : kBorderColor),
          ),
          child: Icon(
            _isLiked ? Icons.thumb_up_alt : Icons.thumb_up_alt_outlined,
            color: _isLiked ? colorScheme.primary : kSubtleTextColor,
            size: 22,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add_shopping_cart_outlined, size: 18),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 16)),
              backgroundColor: MaterialStateProperty.all(kPrimaryGreen),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            onPressed: _addToCart,
            label: Text('Add to Cart', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

} // End of _FoodDetailPageState

// --- Custom Rating Bar Widget ---
// ... (Keep RatingBar class implementation as it was at the end of food_detail_page.dart)
class RatingBar extends StatelessWidget {
  final double initialRating;
  final ValueChanged<double> onRatingUpdate;
  final int starCount;
  final double size;
  final Color starColor;

  const RatingBar({
    super.key,
    required this.initialRating,
    required this.onRatingUpdate,
    this.starCount = 5,
    this.size = 20,
    this.starColor = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    // Prevent negative ratings visually
    double displayRating = initialRating < 0 ? 0 : initialRating;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        double starValue = index + 1.0;
        IconData iconData;

        // Determine star icon based on rating value
        if (displayRating >= starValue) {
          iconData = Icons.star_rounded; // Full star
        } else if (displayRating > index && displayRating < starValue) {
          // Handle half star: check if rating is closer to .5 or full
          iconData = (displayRating - index >= 0.5)
              ? Icons.star_half_rounded // Half star
              : Icons.star_border_rounded; // Empty star (closer to lower integer)
        } else {
          iconData = Icons.star_border_rounded; // Empty star
        }


        return GestureDetector(
          // Detect tap position for smoother rating update
          onTapDown: (details) {
            final RenderBox box = context.findRenderObject() as RenderBox;
            final tapPos = box.globalToLocal(details.globalPosition);
            final double tapX = tapPos.dx - (index * size); // X pos within the current star

            double newRating;
            if (tapX <= size / 2) { // Tapped on the left half
              newRating = index + 0.5;
            } else { // Tapped on the right half
              newRating = index + 1.0;
            }
            // Prevent rating exceeding star count
            onRatingUpdate(newRating.clamp(0.0, starCount.toDouble()));
          },
           // Also allow dragging across stars
          onHorizontalDragUpdate: (details) {
             final RenderBox box = context.findRenderObject() as RenderBox;
            final dragPos = box.globalToLocal(details.globalPosition);
            // Calculate rating based on horizontal position across all stars
            double newRating = (dragPos.dx / (size * starCount)) * starCount;
             // Clamp rating between 0.5 (min selectable) and max stars
             // Round to nearest 0.5
            newRating = (newRating * 2).roundToDouble() / 2;
            onRatingUpdate(newRating.clamp(0.5, starCount.toDouble()));
          },
          child: Icon(
            iconData,
            color: starColor,
            size: size,
          ),
        );
      }),
    );
  }
}
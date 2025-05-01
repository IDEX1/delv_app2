import 'package:flutter/material.dart';
import '../utils/app_colors.dart'; // Import your app colors

class CommentsPage extends StatefulWidget {
  // Optional: Pass food item ID or name if needed for fetching/posting comments later
  // final String foodItemId;
  // const CommentsPage({super.key, required this.foodItemId});

  const CommentsPage({super.key});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final _commentController = TextEditingController();
  // Example local comments list for this page
  final List<Map<String, dynamic>> _comments = [
    {
      'id': 'c1',
      'name': 'FETHI Ahmed',
      'avatarInitial': 'F',
      'text': 'Good',
      'timestamp': '1h ago',
      'isLiked': false,
    },
     {
      'id': 'c2',
      'name': 'Jane Doe',
      'avatarInitial': 'J',
      'text': 'Looks delicious! Will try it soon.',
      'timestamp': '3h ago',
      'isLiked': true,
    },
     {
      'id': 'c3',
      'name': 'Recipe Master',
      'avatarInitial': 'R',
      'text': 'Great combination of ingredients.',
      'timestamp': '1d ago',
      'isLiked': false,
    },
  ];

  // Example user data for the input field avatar
  final String _currentUserAvatarInitial = 'A'; // Example: 'A' for 'Aymen'

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _addComment() {
    final commentText = _commentController.text.trim();
    if (commentText.isNotEmpty) {
      setState(() {
        // Add to the top of the list
        _comments.insert(0, {
          'id': DateTime.now().millisecondsSinceEpoch.toString(), // Simple unique ID
          'name': '', // Use logged-in user name in a real app
          'avatarInitial': _currentUserAvatarInitial,
          'text': commentText,
          'timestamp': 'Just now',
          'isLiked': false,
        });
        _commentController.clear();
      });
      FocusScope.of(context).unfocus(); // Hide keyboard
      print("Comment added: $commentText");
       // Optional: Show confirmation
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(content: Text('Comment posted!')),
      // );
    }
  }

  void _toggleCommentLike(String commentId) {
     setState(() {
       final index = _comments.indexWhere((c) => c['id'] == commentId);
       if (index != -1) {
         _comments[index]['isLiked'] = !_comments[index]['isLiked'];
         print("Toggled like for comment $commentId: ${_comments[index]['isLiked']}");
         // Add backend call here in a real app
       }
     });
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      // Use the app's background color defined in main.dart's theme
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor, // Match background
        elevation: 0, // No shadow
        centerTitle: true,
        // Custom Title with Underline
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Comments',
              style: textTheme.titleLarge?.copyWith(
                color: kTextColor, // Use consistent text color
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              height: 2,
              width: 40, // Adjust width of underline
              color: kTextColor.withOpacity(0.8), // Underline color
              margin: const EdgeInsets.only(top: 4),
            ),
          ],
        ),
        
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            customBorder: const CircleBorder(),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryGreen.withOpacity(0.15), // Light green background
                  border: Border.all(color: kPrimaryGreen, width: 1.5)
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: kPrimaryGreen,
                  size: 18,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // --- List of Comments ---
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return _buildCommentItem(
                  context,
                  textTheme,
                  comment['avatarInitial'] ?? '?',
                  comment['name'] ?? 'Anonymous',
                  comment['text'] ?? '',
                  comment['timestamp'] ?? '',
                  comment['isLiked'] ?? false,
                  () => _toggleCommentLike(comment['id']), // Pass like toggle callback
                );
              },
            ),
          ),
          // --- Bottom Input Area ---
          _buildCommentInputArea(context, colorScheme, textTheme),
        ],
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildCommentItem(
    BuildContext context,
    TextTheme textTheme,
    String avatarInitial,
    String name,
    String text,
    String timestamp,
    bool isLiked,
    VoidCallback onLikeTap,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          CircleAvatar(
            radius: 22,
            backgroundColor: kPrimaryGreen.withOpacity(0.8), // Use theme color
            child: Text(
              avatarInitial.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Name, Comment, Timestamp, Like
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: textTheme.titleMedium?.copyWith(
                    color: kTextColor,
                    fontWeight: FontWeight.w600, // Bold name
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: textTheme.bodyMedium?.copyWith(
                    color: kTextColor.withOpacity(0.85), // Slightly lighter text
                    fontSize: 14,
                    height: 1.3
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      timestamp,
                      style: textTheme.bodySmall?.copyWith(
                        color: kSubtleTextColor,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: onLikeTap, // Call the toggle function
                      child: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: isLiked ? Colors.redAccent : kSubtleTextColor,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentInputArea(BuildContext context, ColorScheme colorScheme, TextTheme textTheme) {
    // This container wraps the input field and send button
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 8, // Adjust for safe area
        left: 10,
        right: 10,
        top: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white, // White background for input area
        borderRadius: BorderRadius.circular(30.0), // Fully rounded corners
        border: Border.all(color: kBorderColor, width: 1.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          // User Avatar Placeholder (matches style in comment list)
          CircleAvatar(
             radius: 18,
             backgroundColor: kPrimaryGreen.withOpacity(0.5), // Lighter version for input
             child: Text(
               _currentUserAvatarInitial.toUpperCase(),
               style: const TextStyle(
                 color: Colors.white,
                 fontWeight: FontWeight.bold,
                 fontSize: 14,
               ),
             ),
          ),
          const SizedBox(width: 10),
          // Text Input Field
          Expanded(
            child: TextField(
              controller: _commentController,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _addComment(),
              style: textTheme.bodyMedium?.copyWith(color: kTextColor, fontSize: 15),
              decoration: InputDecoration(
                hintText: 'Comment...',
                hintStyle: textTheme.bodyMedium?.copyWith(color: kSubtleTextColor, fontSize: 15),
                border: InputBorder.none, // Remove TextField's own border
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true, // Reduce default padding
                contentPadding: const EdgeInsets.symmetric(vertical: 10), // Adjust padding
              ),
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 8),
          // Send Button
          InkWell(
            onTap: _addComment,
            customBorder: const CircleBorder(),
            child: Container(
              padding: const EdgeInsets.all(8),
               decoration: BoxDecoration(
                 color: kPrimaryGreen.withOpacity(0.15), // Light green circle bg
                 shape: BoxShape.circle,
               ),
              child: Icon(
                Icons.send_outlined, // Using outlined send icon
                color: kPrimaryGreen, // Theme green color for icon
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
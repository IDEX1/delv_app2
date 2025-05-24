import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'first_page.dart';
import 'third_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F1E8), // Light cream background
      body: Stack(
        children: [
          // Large yellow circle at top left
          Positioned(
            top: 120,
            left: -150,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD966),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffffe175),
                    shape: BoxShape.circle, // This makes it perfectly circular
                  ),
                ),
              ),
            ),
          ),

          // Small yellow circle top right
          Positioned(
            top: 40,
            right: 15,
            child: Container(
              alignment: Alignment.center,
              width: 170,
              height: 170,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD966),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 170,
                  height: 170,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xffFFE69B),
                    shape: BoxShape.circle, // This makes it perfectly circular
                  ),
                  child: Center(
                    child: Text(
                      "Welcome, to our application",
                      style: TextStyle(
                          color: Color(0xff353535),
                          fontFamily: "ElMessiri",
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Small yellow circle middle left
          Positioned(
            bottom: 175,
            left: 40,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD966),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xffFFE69B),
                    shape: BoxShape.circle, // This makes it perfectly circular
                  ),
                ),
              ),
            ),
          ),

          // Large yellow circle bottom right
          Positioned(
            top: 225,
            right: 40,
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: Color(0xFFFFD966),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xffB9E7AD),
                    shape: BoxShape.circle, // This makes it perfectly circular
                  ),
                ),
              ),
            ),
          ),

          // Small green circle bottom left
          Positioned(
            bottom: 65,
            left: 60,
            child: Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF9ED99E),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color(0xff82CE70),
                    shape: BoxShape.circle, // This makes it perfectly circular
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 30,
            right: -150,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF9ED99E),
                shape: BoxShape.circle,
              ),
              child: InnerShadow(
                shadows: [
                  Shadow(
                    color: Color(0xff797474).withOpacity(0.72),
                    blurRadius: 4,
                    offset: Offset(3, 3),
                  )
                ],
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Color(0xffFFE69B),
                    shape: BoxShape.circle, // This makes it perfectly circular
                  ),
                ),
              ),
            ),
          ),
          // Navigation indicators and buttons
          Positioned(
            bottom: 10,
            right: 80,
            left: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      createCircleTransition(
                        context: context,
                        page: FirstPage(), // You'll need to import or create this
                        centerX: 60 + 40, // left + (width/2)
                        centerY: MediaQuery.of(context).size.height - 65 - 40, // bottom position
                        color: Color(0xff82CE70),
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_circle_left_outlined),
                  color: Color(0xffB9E7AD),
                  iconSize: 35,
                ),
                SizedBox(width: 8),
                Icon(Icons.circle, size: 16, color: Color(0xffB9E7AD)),
                SizedBox(width: 8),
                Icon(Icons.circle_outlined, size: 16, color: Color(0xffB9E7AD)),
                SizedBox(width: 8),
                Icon(Icons.circle_outlined, size: 16, color: Color(0xffB9E7AD)),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      createCircleTransition(
                        context: context,
                        page: ThirdPage(), // You'll need to create this
                        centerX: MediaQuery.of(context).size.width - 40 - 35, // right position
                        centerY: 225 + 35, // top + (height/2)
                        color: Color(0xffB9E7AD),
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_circle_right_outlined),
                  color: Color(0xffB9E7AD),
                  iconSize: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Helper function to create circle transitions
PageRouteBuilder createCircleTransition({
  required BuildContext context,
  required Widget page,
  required double centerX,
  required double centerY,
  required Color color,
}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 2000),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ClipPath(
        clipper: CircleRevealClipper(
          fraction: animation.value,
          centerOffset: Offset(centerX, centerY),
        ),
        child: child,
      );
    },
  );
}

// Circle reveal clipper (same as in first page)
class CircleRevealClipper extends CustomClipper<Path> {
  final double fraction;
  final Offset centerOffset;

  CircleRevealClipper({
    required this.fraction,
    required this.centerOffset,
  });

  @override
  Path getClip(Size size) {
    final radius = fraction * size.height * 1.5;
    final path = Path();
    path.addOval(Rect.fromCircle(center: centerOffset, radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
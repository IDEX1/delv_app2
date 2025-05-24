
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'second_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MenuPlan+',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//       ),
//       home: const FirstPage(),
//     );
//   }
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Delv App',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       home: const FirstPage(),
//        routes: {
//         '/profile': (context) => const ProfilePage(),
//         '/language': (context) => const LanguageSelectionPage(),
//         '/edit_profile': (context) => const EditProfilePage(),
//       },
//     );
//   }
// }

// Custom circle reveal clipper
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

// Custom page route transition
class CircleExpandTransition extends PageRouteBuilder {
  final Widget page;
  final Offset centerOffset;
  final Color circleColor;

  CircleExpandTransition({
    required this.page,
    required this.centerOffset,
    required this.circleColor,
  }) : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: const Duration(milliseconds: 800),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return ClipPath(
        clipper: CircleRevealClipper(
          fraction: animation.value,
          centerOffset: centerOffset,
        ),
        child: child,
      );
    },
  );
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State <FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    // Set a timer to navigate after 4 seconds
    Future.delayed(const Duration(seconds: 4), () {
      navigateToNextPage();
    });
  }

  void navigateToNextPage() {
    // Calculate the center of the top left yellow circle
    // The circle is at (left: -150, top: 120) with width and height of 300
    // So its center is at:
    final centerX = -150 + (300 / 2); // -150 + 150 = 0
    final centerY = 120 + (300 / 2);  // 120 + 150 = 270

    final centerOffset = Offset(centerX, centerY);

    Navigator.of(context).pushReplacement(
      CircleExpandTransition(
        page: SecondPage(),
        centerOffset: centerOffset,
        circleColor: const Color(0xFFFFD966),
      ),
    );
  }

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
            top: 75,
            right: 15,
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
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color(0xffFFE69B),
                    shape: BoxShape.circle, // This makes it perfectly circular
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

          // Center logo and text
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF9ED99E),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Fork icon
                        Transform.rotate(
                          angle: -0.2,
                          child: const Icon(
                            Icons.dinner_dining,
                            color: Color(0xFF9ED99E),
                            size: 60,
                          ),
                        ),

                        // Knife icon
                        Transform.rotate(
                          angle: 0.2,
                          child: const Icon(
                            Icons.kitchen,
                            color: Color(0xFF9ED99E),
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Menu',
                        style: TextStyle(
                          fontFamily: "ElMessiri",
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF9ED99E),
                        ),
                      ),
                      TextSpan(
                        text: 'Plan',
                        style: TextStyle(
                          fontFamily: "ElMessiri",
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFD966),
                        ),
                      ),
                      TextSpan(
                          text: "+",
                          style: TextStyle(
                              fontFamily: "ElMessiri",
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff9ED99E)
                          )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
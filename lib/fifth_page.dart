import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'sign_in.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controllers
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Initialize animations
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    // Start animations
    _fadeController.forward();
    _scaleController.forward();

    // Navigate after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        _navigateToAuthScreens();
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _navigateToAuthScreens() {
    // Navigate directly to sign in screen
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
        const SignInScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOutCubic;

          var tween = Tween(begin: begin, end: end).chain(
              CurveTween(curve: curve)
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F0), // Light cream background
      body: AnimatedBuilder(
        animation: Listenable.merge([_fadeAnimation, _scaleAnimation]),
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: Stack(
                children: [
                  // Large yellow circle at top left with Hero
                  Positioned(
                    top: 120,
                    left: -150,
                    child: Hero(
                      tag: 'yellow-circle-large',
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
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Small yellow circle top right with Hero
                  Positioned(
                    top: 75,
                    right: 15,
                    child: Hero(
                      tag: 'yellow-circle-small-top',
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
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Yellow circle middle right with Hero
                  Positioned(
                    top: 225,
                    right: 40,
                    child: Hero(
                      tag: 'yellow-circle-middle',
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
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Green circle bottom left with Hero and text
                  Positioned(
                    bottom: 45,
                    left: 20,
                    child: Hero(
                      tag: 'green-circle-large',
                      child: Container(
                        width: 180,
                        height: 180,
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
                            alignment: Alignment.center,
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Color(0xff82CE70),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                "Well, let's finish and set you up",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "ElMessiri",
                                  color: Color(0xff353535),
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Large green circle bottom right with Hero
                  Positioned(
                    bottom: 30,
                    right: -150,
                    child: Hero(
                      tag: 'green-circle-bottom',
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
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Loading indicator
                  Positioned(
                    bottom: 100,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xff353535),
                            ),
                            strokeWidth: 3,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Preparing your experience...',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xff666666),
                              fontFamily: "ElMessiri",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
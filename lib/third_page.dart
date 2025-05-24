import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

import 'fourth_page.dart';
import 'second_page.dart';

class ThirdPage extends StatelessWidget{
  const ThirdPage({super.key});

  @override
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
            top: 200,
            right: 20,
            child: Container(
              width: 190,
              height: 190,
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
                  alignment: Alignment.center,
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Color(0xffB9E7AD),
                    shape: BoxShape.circle, // This makes it perfectly circular
                  ),
                  child: Text("We are offering the best dishes for you" ,
                    style: TextStyle(color: Color(0xff353535) ,
                              fontFamily: "ElMessiri" ,
                              fontSize: 24 ,
                              fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,),
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
                        page: SecondPage(), // You'll need to import or create this
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
                Icon(Icons.circle_outlined, size: 16, color: Color(0xffB9E7AD)),
                SizedBox(width: 8),
                Icon(Icons.circle, size: 16, color: Color(0xffB9E7AD)),
                SizedBox(width: 8),
                Icon(Icons.circle_outlined, size: 16, color: Color(0xffB9E7AD)),
                SizedBox(width: 8),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      createCircleTransition(
                        context: context,
                        page: FourthPage(), // You'll need to create this
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
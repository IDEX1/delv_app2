import 'package:delv_app/first_page.dart';
import 'package:delv_app/profil_page.dart';

import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}

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
//       home: const RootScreen(),
//        routes: {
//         '/profile': (context) => const ProfilePage(),
//         '/language': (context) => const LanguageSelectionPage(),
//         '/edit_profile': (context) => const EditProfilePage(),
//       },
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delv App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const FirstPage(),
       routes: {
        '/profile': (context) => const ProfilePage(),
        '/language': (context) => const LanguageSelectionPage(),
        '/edit_profile': (context) => const EditProfilePage(),
      },
    );
  }
}

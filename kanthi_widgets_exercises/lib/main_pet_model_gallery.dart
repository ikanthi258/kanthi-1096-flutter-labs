// ============================================
// A custom widget QuoteCard
//
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// This code re-using some code from Lab3 exercise1
// and create models directory to contained pet model
// for flexible re-use in any conditions such as card-color
// text-color, image-url
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2026-01-06
// ============================================

import 'package:flutter/material.dart';
import '../screens/pets_gallery_screen.dart';

void main() {
  runApp(MainPetModelGallery());
}

class MainPetModelGallery extends StatelessWidget {
  const MainPetModelGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets Model Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: PetsGalleryScreen(),
    );
  }
}

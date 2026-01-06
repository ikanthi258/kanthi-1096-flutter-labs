// ============================================
// A custom widget QuoteCard
//
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// This code using screen and component from other directory to show
// card of pets by showing images and name of its
// using Image.network to import image from internet by URL
// and using container to create box of object to contained elements.
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2026-01-06
// ============================================

import 'package:flutter/material.dart';
import 'screens/pets_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'My Pet App',
      debugShowCheckedModeBanner: false,
      home: const PetsScreen(),
    ),
  );
}

// ============================================
// A custom widget QuoteCard
//
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// This code using Padding, Expanded, Row, Colum layout to show quote image and author's name
// using SizeBox to create space between first name and last name
// Text style : text size = 36 with bold style and blue color.
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2025-12-16
// ============================================

import 'package:flutter/material.dart';
import 'components/custom_font.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(child: CustomFont(name: "กันต์ธีร์ พระเขียนทอง")),
      ),
    );
  }
}

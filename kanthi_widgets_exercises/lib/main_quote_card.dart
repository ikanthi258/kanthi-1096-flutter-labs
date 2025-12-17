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

void main() {
  runApp(const QuoteCard());
}

class QuoteCard extends StatelessWidget {
  const QuoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    const String authorFirstName = 'Bhagavad';
    const String authorLastName = 'Gita';
    const String quotePath = 'assets/my_fav_quote.jpg';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('My Favorite Quote')),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset(quotePath, height: 500, fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      authorFirstName,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      authorLastName,
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

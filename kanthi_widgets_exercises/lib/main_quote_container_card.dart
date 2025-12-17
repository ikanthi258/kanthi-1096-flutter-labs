// ============================================
// A custom widget QuoteContainerCard
//
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// This code re-using code from 'main_quote_card.dart' to create container
// for author's name and applied Margin, Padding to create space between text.
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2025-12-16
// ============================================

import 'package:flutter/material.dart';

void main() {
  runApp(const QuoteContainerCard());
}

class QuoteContainerCard extends StatelessWidget {
  const QuoteContainerCard({super.key});

  @override
  Widget build(BuildContext context) {
    const String authorName = 'Bhagavad Gita';
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
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 120),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(color: Colors.deepPurple, width: 1.0),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [BoxShadow(blurRadius: 15, offset: Offset(0, 3))],
                ),
                child: Text(authorName, style: TextStyle(fontSize: 36)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

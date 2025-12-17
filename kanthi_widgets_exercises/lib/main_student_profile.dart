// ============================================
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// This code using Row, Colum layout to show student information
// included Name Lastname and student's ID and showed it center of the screen.
// Text style : text size = 24 with bold style.
//
// @author Kanthi Phrakhienthong
// @date 2025-12-16
// ============================================

import 'package:flutter/material.dart';

void main() {
  runApp(const StudentProfile());
}

class StudentProfile extends StatelessWidget {
  const StudentProfile({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String name = 'Kanthi Phrakhienthong';
    const String ID = '663040109-6';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Student Profile')),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  ID,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

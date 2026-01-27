// ============================================
// A custom widget ProfileCardRating
//
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// This code showing actor's profile card and have their contracts.
// Implemented image by using stack and listTile for contracts.
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2026-01-27
// ============================================
import 'package:flutter/material.dart';
import 'screens/profile_card_rating.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card',

      // Dark Theme Configuration
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,

      home: ProfileCardRating(),
    ),
  );
}

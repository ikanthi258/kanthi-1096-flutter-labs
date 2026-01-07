// ============================================
// A custom widget QuoteContainerCard
//
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
//
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2026-01-07
// ============================================

import 'package:flutter/material.dart';
import 'package:kanthi_first_app_test/screens/contact_list_screen.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: ContactListScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// ============================================
// A custom widget QuoteContainerCard
//
// AI DOCUMENTATION
// Use AI only searching some syntax for decoration such as example hex-color-code.
//
// This code is showing contact lists and has a floating button that allow
// user to create more contacts with state
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2026-01-09
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

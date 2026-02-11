// ============================================
// A custom widget MainProfileButton
//
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// This code showing profile and ElevatedButton with AlertDialog
//
// @author Kanthi Phrakhienthong
// @date 2025-02-11
// ============================================
import 'package:flutter/material.dart';
import 'components/profile_with_button.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Button',
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.light,
        ),
      ),
      themeMode: ThemeMode.system,
      home: MainProfileButton(),
    ),
  );
}

class MainProfileButton extends StatelessWidget {
  const MainProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileWithButton();
  }
}

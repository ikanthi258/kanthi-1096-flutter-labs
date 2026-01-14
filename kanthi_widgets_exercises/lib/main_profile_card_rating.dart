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

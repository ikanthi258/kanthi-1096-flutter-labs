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

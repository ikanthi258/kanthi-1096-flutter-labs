import 'package:flutter/material.dart';
import '../screens/pets_gallery_screen.dart';

void main() {
  runApp(MainPetModelGallery());
}

class MainPetModelGallery extends StatelessWidget {
  const MainPetModelGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pets Model Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
        ),
      ),
      home: PetsGalleryScreen(),
    );
  }
}

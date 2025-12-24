import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String imgURL;
  const PetCard({super.key, required this.name, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 120),
          color: Colors.pinkAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 10,
            children: [
              Image.network(imgURL, width: 120, height: 120, fit: BoxFit.cover),
              Text(
                name,
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

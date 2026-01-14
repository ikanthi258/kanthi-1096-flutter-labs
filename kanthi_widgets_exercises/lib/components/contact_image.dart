import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  final String imagePath;
  final String name;
  const ContactImage({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 160),
        Container(
          decoration: const BoxDecoration(color: Colors.black45),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

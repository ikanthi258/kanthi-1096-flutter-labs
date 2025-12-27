import 'package:flutter/material.dart';

class PetCard extends StatelessWidget {
  final String name;
  final String imgURL;
  const PetCard({super.key, required this.name, required this.imgURL});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: Image.network(
            imgURL,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

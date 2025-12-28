import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class PetCardWithModel extends StatelessWidget {
  final PetModel pet;
  const PetCardWithModel({super.key, required this.pet});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: Image.network(
            pet.imageURL,
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: 120,
          decoration: BoxDecoration(
            color: pet.backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.0),
              bottomRight: Radius.circular(12.0),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            pet.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: pet.textColor,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class PetModel {
  final String name;
  final String imageURL;
  final Color backgroundColor;
  final Color textColor;
  const PetModel({
    required this.name,
    required this.imageURL,
    this.backgroundColor = Colors.pinkAccent,
    this.textColor = Colors.white,
  });
}

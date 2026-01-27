import 'package:flutter/material.dart';

class FacultyModel {
  final String name;
  final String thaiName;
  final String imageUrl;
  final String description;

  const FacultyModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.thaiName,
  });
}

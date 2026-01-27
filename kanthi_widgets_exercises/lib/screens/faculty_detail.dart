import 'package:flutter/material.dart';
import '../models/faculty_model.dart';

class FacultyDetail extends StatelessWidget {
  final FacultyModel facultyModel;

  const FacultyDetail({super.key, required this.facultyModel});

  @override
  Widget build(BuildContext context) {
    Color textColor =
        (ThemeData.estimateBrightnessForColor(
              Theme.of(context).colorScheme.primary,
            ) ==
            Brightness.dark
        ? Colors.white
        : Colors.black);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(facultyModel.name)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 20),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(25.0),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  facultyModel.description,
                  style: TextStyle(fontSize: 20, color: textColor),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 20),
            child: Text(
              facultyModel.thaiName,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(facultyModel.imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

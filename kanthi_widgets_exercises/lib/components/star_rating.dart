import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  const StarRating({super.key, required this.rating, required this.size});

  @override
  Widget build(BuildContext context) {
    final int fullStars = rating.floor();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++)
          if (i < fullStars)
            Icon(Icons.star, size: size, color: Colors.amberAccent)
          else if (i == fullStars && (rating - fullStars) >= 0.5)
            Icon(Icons.star_half, size: size, color: Colors.amberAccent)
          else
            Icon(Icons.star_border, size: size, color: Colors.grey),
      ],
    );
  }
}

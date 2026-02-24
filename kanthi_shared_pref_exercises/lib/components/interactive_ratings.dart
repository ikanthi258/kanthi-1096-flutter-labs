import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InteractiveRatings extends StatefulWidget {
  final SharedPreferencesWithCache prefs;
  final Color inactiveColor;
  final Color activeColor;
  const InteractiveRatings({
    super.key,
    required this.prefs,
    required this.inactiveColor,
    required this.activeColor,
  });

  @override
  RatingState createState() => RatingState();
}

class RatingState extends State<InteractiveRatings> {
  static const String _ratingKey = 'star_rating';
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.prefs.getInt(_ratingKey) ?? 0;
  }

  void _updateRating(int newRating) {
    setState(() {
      _rating = newRating;
    });
    widget.prefs.setInt(_ratingKey, newRating);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        final starIndex = index + 1;
        final isActive = starIndex <= _rating;

        return IconButton(
          onPressed: () => _updateRating(starIndex),
          icon: Icon(
            isActive ? Icons.star : Icons.star_border,
            color: isActive ? widget.activeColor : widget.inactiveColor,
          ),
        );
      }),
    );
  }
}

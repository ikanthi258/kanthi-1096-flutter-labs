import 'package:flutter/material.dart';

class QChoice extends StatefulWidget {
  final String text;
  final Color foreground, background;
  final bool isCorrect;

  const QChoice({
    super.key,
    required this.text,
    this.foreground = Colors.white,
    this.background = Colors.blueAccent,
    this.isCorrect = false,
  });

  @override
  State<StatefulWidget> createState() => QChoiceState();
}

class QChoiceState extends State<QChoice> {
  bool _hasBeenTapped = false;
  int score = 0;

  // Getter method to help change choices's background color //
  Color _getCurrentBackgroundColor() {
    if (!_hasBeenTapped) {
      return widget.background;
    }
    return widget.isCorrect ? Colors.green : Colors.red;
  }

  void _handleChoiceTap() {
    // Return nothing if choice already tabbed //
    if (_hasBeenTapped) return;

    setState(() {
      _hasBeenTapped = true;
      if (widget.isCorrect) score += 1;
    });

    // Showing Dialog if user tabbed on choices //
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.isCorrect ? 'Correct!' : 'Incorrect'),
          content: Text('Your score is $score'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleChoiceTap,
      child: Container(
        decoration: BoxDecoration(
          color: _getCurrentBackgroundColor(),
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.foreground,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../models/choice.dart';

class QuestionChoiceCard extends StatefulWidget {
  final Choice choice;
  final bool isSelected;
  final bool canSelect;
  final VoidCallback onSelected;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.canSelect,
    required this.onSelected,
  });

  @override
  State<QuestionChoiceCard> createState() => _QuestionChoiceCardState();
}

class _QuestionChoiceCardState extends State<QuestionChoiceCard> {
  @override
  Widget build(BuildContext context) {
    Color bgColor;
    if (widget.isSelected) {
      bgColor = widget.choice.isCorrect ? Colors.green : Colors.red;
    } else {
      bgColor = widget.choice.displayColor;
    }

    // Return GestureDetector wrapping Container //
    return GestureDetector(
      onTap: widget.canSelect ? widget.onSelected : null,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.choice.name,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}

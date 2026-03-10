import 'package:flutter/material.dart';
import 'package:kanthi_interactivity_exercises/models/choice.dart';

class QuestionChoiceCard extends StatelessWidget {
  final Choice choice;
  final bool isSelected;
  final bool canSelect; // true during quiz, false on ResultsScreen
  final VoidCallback? onTap;

  const QuestionChoiceCard({
    super.key,
    required this.choice,
    required this.isSelected,
    required this.canSelect,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Color backgroundColor;
    if (!canSelect && choice.isCorrect) {
      // ResultsScreen: always show correct answer in green
      backgroundColor = Colors.green;
    } else if (!canSelect && isSelected && !choice.isCorrect) {
      // ResultsScreen: user's wrong selection in red
      backgroundColor = Colors.red;
    } else if (isSelected) {
      // Quiz gameplay: primaryContainer highlight only (no green/red)
      backgroundColor = colorScheme.primaryContainer;
    } else {
      backgroundColor = choice.displayColor;
    }

    return GestureDetector(
      onTap: canSelect ? onTap : null,
      child: Card(
        color: backgroundColor,
        elevation: isSelected ? 4 : 1,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              choice.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ),
    );
  }
}

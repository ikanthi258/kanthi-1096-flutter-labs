import 'package:flutter/material.dart';
import 'package:kanthi_widgets_exercises/utils/responsive.dart';
import '../models/question.dart';
import '../components/question_choice_card.dart';

class QuizScreen extends StatefulWidget {
  final QuestionMultiple question;
  final ValueChanged<bool> onAnswered;
  final VoidCallback onNext;

  const QuizScreen({
    super.key,
    required this.question,
    required this.onAnswered,
    required this.onNext,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedIndex;
  bool selectionMade = false;

  void _handleChoiceSelected(int index) {
    if (selectionMade) return; // Prevent multiple selections

    setState(() {
      selectedIndex = index;
      selectionMade = true;
    });

    // Notify parent whether answer is correct //
    bool isCorrect = widget.question.choices[index].isCorrect;
    widget.onAnswered(isCorrect);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Responsive.getScreenPadding(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Question title and text//
            Text(
              widget.question.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Text(
              widget.question.text,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),

            // Image //
            Expanded(
              child: Image.asset(
                widget.question.imagePath,
                fit: BoxFit.contain,
              ),
            ),

            // Choices grid //
            Expanded(
              child: GridView.builder(
                padding: Responsive.getGridPadding(context),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: Responsive.getGridChildRatio(context),
                ),
                itemCount: widget.question.choices.length,
                itemBuilder: (context, index) {
                  return QuestionChoiceCard(
                    choice: widget.question.choices[index],
                    isSelected: selectedIndex == index,
                    canSelect: !selectionMade,
                    onSelected: () => _handleChoiceSelected(index),
                  );
                },
              ),
            ),

            // Next button (shown only after selection) //
            if (selectionMade)
              Center(
                child: SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: widget.onNext,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

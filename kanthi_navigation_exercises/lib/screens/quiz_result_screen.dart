import 'package:flutter/material.dart';
import 'package:kanthi_interactivity_exercises/models/question.dart';

class ResultsScreen extends StatelessWidget {
  final List<QuestionMultiple> questions;
  final Map<int, int?> selectedAnswers;
  final int score;
  final VoidCallback onRestart;

  const ResultsScreen({
    super.key,
    required this.questions,
    required this.selectedAnswers,
    required this.score,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            color: colorScheme.primaryContainer,
            child: Column(
              children: [
                Text(
                  'Your Score',
                  style: textTheme.headlineMedium?.copyWith(
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$score / ${questions.length}',
                  style: textTheme.displayLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final selectedIndex = selectedAnswers[index];
                final correctChoice = question.choices.firstWhere(
                  (c) => c.isCorrect,
                );

                // Avatar color = displayColor from correct choice
                final Color avatarColor = correctChoice.displayColor;

                final String feedbackText;
                final Color feedbackColor;

                if (selectedIndex == null) {
                  feedbackText =
                      'Not answered - Correct: ${correctChoice.name}';
                  feedbackColor = Colors.orange;
                } else if (question.choices[selectedIndex].isCorrect) {
                  feedbackText = '${correctChoice.name} ✓';
                  feedbackColor = Colors.green;
                } else {
                  final wrongChoice = question.choices[selectedIndex];
                  feedbackText =
                      '${wrongChoice.name} ✗ Should be ${correctChoice.name}';
                  feedbackColor = Colors.red;
                }

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: avatarColor,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(question.title, style: textTheme.titleMedium),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        feedbackText,
                        style: textTheme.bodyMedium?.copyWith(
                          color: feedbackColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: ElevatedButton(
              onPressed: onRestart,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Restart'),
            ),
          ),
        ],
      ),
    );
  }
}

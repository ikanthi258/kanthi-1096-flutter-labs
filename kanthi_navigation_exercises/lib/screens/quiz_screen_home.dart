import 'package:flutter/material.dart';
import 'package:kanthi_interactivity_exercises/models/question.dart';
import '../components/question_choice_card.dart';

class QuizScreenHome extends StatefulWidget {
  final QuestionMultiple question;
  final int questionNumber;
  final int totalQuestions;
  final int? initialSelectedIndex;
  final bool isInitiallyAnswered;
  final bool showPreviousButton;
  final bool showNextButton;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onHome;
  final Function(int selectedIndex, bool wasAnswered, int? previousIndex)
  onAnswerSelected;

  const QuizScreenHome({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
    required this.initialSelectedIndex,
    required this.isInitiallyAnswered,
    required this.showPreviousButton,
    required this.showNextButton,
    required this.onPrevious,
    required this.onNext,
    required this.onHome,
    required this.onAnswerSelected,
  });

  @override
  State<QuizScreenHome> createState() => _QuizScreenHomeState();
}

class _QuizScreenHomeState extends State<QuizScreenHome> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  void didUpdateWidget(covariant QuizScreenHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialSelectedIndex != widget.initialSelectedIndex ||
        oldWidget.isInitiallyAnswered != widget.isInitiallyAnswered) {
      setState(() {
        selectedIndex = widget.initialSelectedIndex;
      });
    }
  }

  void _handleTap(int index) {
    final previousIndex = selectedIndex;
    setState(() {
      selectedIndex = index;
    });
    widget.onAnswerSelected(index, widget.isInitiallyAnswered, previousIndex);
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.question;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Question ${widget.questionNumber} of ${widget.totalQuestions}',
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            question.title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            question.text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              question.imagePath,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                color: Theme.of(context).colorScheme.surfaceVariant,
                child: const Icon(Icons.image_not_supported, size: 64),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2.5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              children: List.generate(question.choices.length, (index) {
                return QuestionChoiceCard(
                  choice: question.choices[index],
                  isSelected: selectedIndex == index,
                  canSelect: true,
                  onTap: () => _handleTap(index),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Previous — ใช้ Visibility+maintainSize เพื่อให้ Home อยู่ตรงกลางเสมอ
              Visibility(
                visible: widget.showPreviousButton,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: ElevatedButton(
                  onPressed: widget.onPrevious,
                  child: const Text('Previous'),
                ),
              ),
              // Home — แสดงเสมอ ไม่มี Visibility wrapper
              ElevatedButton.icon(
                onPressed: widget.onHome,
                icon: const Icon(Icons.home),
                label: const Text('Home'),
              ),
              // Next — ใช้ Visibility+maintainSize
              Visibility(
                visible: widget.showNextButton,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: ElevatedButton(
                  onPressed: widget.onNext,
                  child: Text(
                    widget.questionNumber == widget.totalQuestions
                        ? 'Submit'
                        : 'Next',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

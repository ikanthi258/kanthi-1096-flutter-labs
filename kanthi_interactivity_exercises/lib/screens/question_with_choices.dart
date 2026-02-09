import 'package:flutter/material.dart';
import 'package:kanthi_interactivity_exercises/components/question_choice.dart';
import 'package:kanthi_widgets_exercises/utils/responsive.dart';

class Question extends StatelessWidget {
  final String title;
  final String text;
  final String imagePath;
  final List<QChoice> choices;

  const Question({
    super.key,
    required this.title,
    required this.imagePath,
    required this.choices,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        body: Padding(
          padding: Responsive.getScreenPadding(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Expanded(child: Image.asset(imagePath, fit: BoxFit.contain)),
              Expanded(
                child: GridView.builder(
                  padding: Responsive.getGridPadding(context),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: Responsive.getGridChildRatio(context),
                  ),
                  itemCount: choices.length,
                  itemBuilder: (context, index) {
                    return choices[index];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

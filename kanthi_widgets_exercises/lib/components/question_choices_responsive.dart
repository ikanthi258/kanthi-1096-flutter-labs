import 'package:flutter/material.dart';
import 'package:kanthi_first_app_test/utils/responsive.dart';
import 'question_choice.dart';

class QuestionChoicesResponsive extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<QuestionChoice> choices;

  const QuestionChoicesResponsive({
    super.key,
    required this.title,
    required this.imagePath,
    required this.choices,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        body: Padding(
          padding: Responsive.getScreenPadding(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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

import 'choice.dart';

class QuestionMultiple {
  final String title;
  final String text;
  final String imagePath;
  final List<Choice> choices;

  const QuestionMultiple({
    required this.title,
    required this.text,
    required this.imagePath,
    required this.choices,
  });
}

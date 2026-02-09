import 'package:flutter/material.dart';
import 'package:kanthi_interactivity_exercises/components/question_choice.dart';
import 'screens/question_with_choices.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'quiz',
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
          brightness: Brightness.dark,
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
          brightness: Brightness.light,
        ),
      ),
      home: MainQuizQuestionResponsive(),
      themeMode: ThemeMode.system,
    ),
  );
}

class MainQuizQuestionResponsive extends StatelessWidget {
  const MainQuizQuestionResponsive({super.key});
  static const String appTitle = 'Quiz App by 663040109-6';

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final bool isPortrait = (orientation == Orientation.portrait);
    return Scaffold(
      appBar: isPortrait
          ? AppBar(centerTitle: true, title: Text(appTitle))
          : null,
      body: SafeArea(
        child: Center(
          child: Question(
            title: 'Question 1',
            text: 'What is this picture?',
            imagePath: 'packages/kanthi_widgets_exercises/assets/kku.jpg',
            choices: [
              QChoice(
                text: 'Khon Kaen University',
                background: Colors.orangeAccent,
                isCorrect: true,
              ),
              QChoice(
                text: 'Chiang Mai University',
                background: Colors.purpleAccent,
              ),
              QChoice(
                text: 'Chulalongkorn University',
                background: Colors.pinkAccent,
              ),
              QChoice(
                text: 'Mahidol University',
                background: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

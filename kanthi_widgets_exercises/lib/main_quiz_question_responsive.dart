import 'package:flutter/material.dart';
import 'components/question_choice.dart';
import 'components/question_choices_responsive.dart';

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
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(appTitle)),
      body: QuestionChoicesResponsive(
        title: 'What is this picture?',
        imagePath: 'assets/kku.jpg',
        choices: [
          QuestionChoice(
            name: 'Chiang Mai University',
            bgColor: Colors.purpleAccent,
          ),
          QuestionChoice(
            name: 'Khon Kaen University',
            bgColor: Colors.orangeAccent,
          ),
          QuestionChoice(
            name: 'Chulalongkorn University',
            bgColor: Colors.pinkAccent,
          ),
          QuestionChoice(
            name: 'Mahidol University',
            bgColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

// ============================================
// A custom widget MainQuizCheckNext
//
// AI DOCUMENTATION
// Using AI for sample of syntax and correcting error.
// such as 'how to use ValueKey', 'How parent and child widget work'
//
// This code showing quiz question and and checking answer correct or not
// but more implement with Next button to show score and restart the quiz
//
// @author Kanthi Phrakhienthong
// @date 2025-02-11
// ============================================
import 'package:flutter/material.dart';
import 'screens/quiz_screen.dart';
import 'models/choice.dart';
import 'models/question.dart';

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
      home: MainQuizCheckNext(),
      themeMode: ThemeMode.system,
    ),
  );
}

// Quiz Data //
final List<QuestionMultiple> questions = [
  QuestionMultiple(
    title: 'Question 1',
    text: 'What is this picture?',
    imagePath: 'packages/kanthi_widgets_exercises/assets/kku.jpg',
    choices: [
      Choice(
        name: 'Khon Kaen University',
        isCorrect: true,
        displayColor: Colors.orangeAccent,
      ),
      Choice(
        name: 'Chiang Mai University',
        isCorrect: false,
        displayColor: Colors.purpleAccent,
      ),
      Choice(
        name: 'Chulalongkorn University',
        isCorrect: false,
        displayColor: Colors.pinkAccent,
      ),
      Choice(
        name: 'Mahidol University',
        isCorrect: false,
        displayColor: Colors.blueAccent,
      ),
    ],
  ),
];

class MainQuizCheckNext extends StatefulWidget {
  const MainQuizCheckNext({super.key});
  static const String appTitle = 'Quiz App by 663040109-6';

  @override
  State<MainQuizCheckNext> createState() => _MainQuizCheckNextState();
}

class _MainQuizCheckNextState extends State<MainQuizCheckNext> {
  int currentQuestionIndex = 0;
  int score = 0;
  int _resetCounter = 0;

  void _handleAnswered(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        score++;
      });
    }
  }

  void _goToNextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _showResultDialog();
    }
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text('Your score: $score/${questions.length}'),
        actions: [
          TextButton(
            onPressed: _restartQuiz,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }

  void _restartQuiz() {
    // Close dialog //
    Navigator.of(context).pop();
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _resetCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final bool isPortrait = (orientation == Orientation.portrait);

    return Scaffold(
      appBar: isPortrait
          ? AppBar(centerTitle: true, title: Text(MainQuizCheckNext.appTitle))
          : null,
      body: SafeArea(
        child: QuizScreen(
          key: ValueKey('${currentQuestionIndex}_$_resetCounter'),
          question: questions[currentQuestionIndex],
          onAnswered: _handleAnswered,
          onNext: _goToNextQuestion,
        ),
      ),
    );
  }
}

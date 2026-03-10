import 'package:flutter/material.dart';
import 'package:kanthi_interactivity_exercises/models/choice.dart';
import 'package:kanthi_interactivity_exercises/models/question.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
      ),
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int currentQuestionIndex = 0;
  int score = 0;
  Map<int, int?> _selectedAnswers = {};
  Map<int, bool> _questionAnswered = {};
  int resetCounter = 0;

  final List<QuestionMultiple> questions = [
    QuestionMultiple(
      title: 'Where is this picture?',
      text: 'Select the correct city.',
      imagePath: 'assets/images/chiangmai.jpg',
      choices: [
        Choice(
          name: 'Chiang Mai',
          isCorrect: true,
          displayColor: Colors.deepPurpleAccent,
        ),
        Choice(
          name: 'Bangkok',
          isCorrect: false,
          displayColor: Colors.deepOrangeAccent,
        ),
        Choice(
          name: 'Phuket',
          isCorrect: false,
          displayColor: Colors.lightBlueAccent,
        ),
        Choice(name: 'Pattaya', isCorrect: false, displayColor: Colors.green),
      ],
    ),
    QuestionMultiple(
      title: 'Where is this picture?',
      text: 'Select the correct city.',
      imagePath: 'assets/images/khonkaen.jpg',
      choices: [
        Choice(
          name: 'Udon Thani',
          isCorrect: false,
          displayColor: Colors.purpleAccent,
        ),
        Choice(
          name: 'Khon Kaen',
          isCorrect: true,
          displayColor: Colors.orangeAccent,
        ),
        Choice(
          name: 'Korat',
          isCorrect: false,
          displayColor: Colors.lightBlueAccent,
        ),
        Choice(
          name: 'Roi Et',
          isCorrect: false,
          displayColor: Colors.pinkAccent,
        ),
      ],
    ),
    QuestionMultiple(
      title: 'Where is this picture?',
      text: 'Select the correct city.',
      imagePath: 'assets/images/ubon.jpg',
      choices: [
        Choice(
          name: 'Mukdahan',
          isCorrect: false,
          displayColor: Colors.amberAccent,
        ),
        Choice(name: 'Korat', isCorrect: false, displayColor: Colors.green),
        Choice(
          name: 'Khon Kaen',
          isCorrect: false,
          displayColor: Colors.deepOrangeAccent,
        ),
        Choice(
          name: 'Ubon Ratchathani',
          isCorrect: true,
          displayColor: Colors.deepPurpleAccent,
        ),
      ],
    ),
  ];

  void _handleAnswerSelected(
    int selectedIndex,
    bool wasAnswered,
    int? previousIndex,
  ) {
    setState(() {
      final choices = questions[currentQuestionIndex].choices;
      // Subtract score if previous selection was correct
      if (wasAnswered && previousIndex != null) {
        if (choices[previousIndex].isCorrect) score--;
      }
      // Add score if new selection is correct
      if (choices[selectedIndex].isCorrect) score++;
      _selectedAnswers[currentQuestionIndex] = selectedIndex;
      _questionAnswered[currentQuestionIndex] = true;
    });
  }

  void _handleNext() {
    if (currentQuestionIndex == questions.length - 1) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Quiz Complete!'),
          content: Text('Your score: $score / ${questions.length}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _restartQuiz();
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      );
    } else {
      setState(() => currentQuestionIndex++);
    }
  }

  void _handlePrevious() {
    setState(() => currentQuestionIndex--);
  }

  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _selectedAnswers = {};
      _questionAnswered = {};
      resetCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App By 663040109-6')),
      body: QuizScreen(
        key: ValueKey('$resetCounter-$currentQuestionIndex'),
        question: questions[currentQuestionIndex],
        questionNumber: currentQuestionIndex + 1,
        totalQuestions: questions.length,
        initialSelectedIndex: _selectedAnswers[currentQuestionIndex],
        isInitiallyAnswered: _questionAnswered[currentQuestionIndex] ?? false,
        showPreviousButton: currentQuestionIndex > 0,
        showNextButton: true,
        onPrevious: _handlePrevious,
        onNext: _handleNext,
        onAnswerSelected: _handleAnswerSelected,
      ),
    );
  }
}

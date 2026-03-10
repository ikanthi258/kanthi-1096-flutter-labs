import 'package:flutter/material.dart';
import 'package:kanthi_interactivity_exercises/models/choice.dart';
import 'package:kanthi_interactivity_exercises/models/question.dart';
import 'screens/quiz_screen_home.dart';
import 'screens/quiz_result_screen.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => const QuizCoverPage(),
        '/quiz': (context) => const QuizApp(),
      },
    );
  }
}

class QuizCoverPage extends StatelessWidget {
  const QuizCoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Icon(Icons.quiz_outlined, size: 120, color: colorScheme.primary),
              const SizedBox(height: 24),
              Text(
                'Welcome to the Quiz App KT',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: colorScheme.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'By Kanthi Phrakhienthong 663040109-6',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/quiz'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(160, 48),
                  ),
                  child: const Text('Start'),
                ),
              ),
            ],
          ),
        ),
      ),
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
      if (wasAnswered && previousIndex != null) {
        if (choices[previousIndex].isCorrect) score--;
      }
      if (choices[selectedIndex].isCorrect) score++;
      _selectedAnswers[currentQuestionIndex] = selectedIndex;
      _questionAnswered[currentQuestionIndex] = true;
    });
  }

  void _handleNext() {
    if (currentQuestionIndex == questions.length - 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            questions: questions,
            selectedAnswers: Map.from(_selectedAnswers),
            score: score,
            onRestart: _restartQuiz,
          ),
        ),
      );
    } else {
      setState(() => currentQuestionIndex++);
    }
  }

  void _handlePrevious() => setState(() => currentQuestionIndex--);

  void _handleHome() => Navigator.popUntil(context, (route) => route.isFirst);

  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      score = 0;
      _selectedAnswers = {};
      _questionAnswered = {};
      resetCounter++;
    });
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz App By 663040109-6')),
      body: QuizScreenHome(
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
        onHome: _handleHome,
        onAnswerSelected: _handleAnswerSelected,
      ),
    );
  }
}

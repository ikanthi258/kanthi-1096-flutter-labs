// ============================================
// A custom widget QuoteContainerCard
//
// AI DOCUMENTATION
// Use AI only searching some syntax for text style such as
// textTheme headlineSmall with copy color from colorScheme and others.
//
// This code showing quiz question by showing image of place.
// And there are 4 choices that decorated with bgColor and fgColor(text)
// you can customize colors by yourself.
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2026-01-12
// ============================================

import 'package:flutter/material.dart';
import 'components/question_with_choices.dart';
import 'components/question_choice.dart';

void main() {
  const String appTitle = 'Quiz App By 663040109-6';
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orangeAccent,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text(appTitle))),
        body: QuestionWithChoices(
          title: 'What is this picture?',
          imagePath: 'assets/kku.jpg',
          choices: [
            QuestionChoice(
              name: 'Chulalongkorn University',
              bgColor: Colors.purpleAccent,
              fgColor: Colors.yellowAccent,
            ),
            QuestionChoice(
              name: 'Khon Kaen University',
              bgColor: Colors.deepOrange,
            ),
            QuestionChoice(
              name: 'Ubon Ratchathani University',
              bgColor: Colors.pinkAccent,
            ),
            QuestionChoice(
              name: 'Mahidol University',
              bgColor: Colors.lightBlueAccent,
            ),
          ],
        ),
      ),
    ),
  );
}

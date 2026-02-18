// ============================================
// Async API Program : Fetch User Data
//
// AI DOCUMENTATION
// use AI for learning and error explanation such as network error,
// API error status codes, and environment variable usage.
// Author implemented code almost independently, using AI to help correct
// understanding and concept clarification.
//
// This program calls a REST API to fetch user data
// and parses JSON response into a User data model using factory constructor.
// The application implements asynchronous API calling with error handling,
// and displays the result in Flutter UI using RichText widget.
//
// @author Kanthi Phrakhienthong
// @date 2026-02-18
// ============================================
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kanthi_async_exercises/models/user.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API data calling',
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
      themeMode: ThemeMode.system,
      home: MainApiDataModel(),
    ),
  );
}

class MainApiDataModel extends StatefulWidget {
  const MainApiDataModel({super.key});

  @override
  State<MainApiDataModel> createState() => _MainApiScreen();
}

class _MainApiScreen extends State<MainApiDataModel> {
  User? user;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/1'),
        headers: {
          'User-Agent': 'Mozilla/5.0',
          'Accept': 'application/json, text/plain, */*',
          'Accept-Language': 'en-US,en;q=0.9',
          'Connection': 'keep-alive',
        },
      );

      print("STATUS: ${response.statusCode}");
      print("BODY: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          user = User.fromJson(data);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "API error ${response.statusCode}";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (errorMessage.isNotEmpty) {
      return Scaffold(body: Center(child: Text(errorMessage)));
    }

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Call API By Kanthi 1096'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: user!.name,
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.primary,
                ),
              ),

              TextSpan(text: ' works at ', style: textTheme.titleLarge),

              TextSpan(
                text: user!.company,
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

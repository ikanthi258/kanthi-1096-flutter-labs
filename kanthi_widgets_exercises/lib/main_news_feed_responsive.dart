import 'package:flutter/material.dart';
import 'screens/news_feed_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive News Feed App',
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.tealAccent,
          brightness: Brightness.dark,
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.tealAccent,
          brightness: Brightness.light,
        ),
      ),
      themeMode: ThemeMode.system,
      home: MainNewsFeedResponsive(),
    ),
  );
}

class MainNewsFeedResponsive extends StatelessWidget {
  const MainNewsFeedResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('News Feed'), centerTitle: true),
        body: NewsFeedScreen(),
      ),
    );
  }
}

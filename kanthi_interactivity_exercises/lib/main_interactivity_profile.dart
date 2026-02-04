import 'package:flutter/material.dart';
import 'screens/profile_card_rating_responsive.dart';

void main() {
  runApp(
    MaterialApp(
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
      home: MainInteractivityProfile(),
    ),
  );
}

class MainInteractivityProfile extends StatelessWidget {
  const MainInteractivityProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfileCardRatingResponsive();
  }
}

// ============================================
// A custom widget MainProfileCardRatingResponsive
//
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// This code using MediaQuery of Orientation to check what position of the screen
// So user can rotate screen to landscape and portrait with all components still working.
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2025-02-03
// ============================================
import 'package:flutter/material.dart';
import 'components/contact_image.dart';
import 'components/contact_info.dart';
import 'components/ratings.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Card',
      // Dark Theme Configuration
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: MainProfileCardRatingResponsive(),
    ),
  );
}

class MainProfileCardRatingResponsive extends StatelessWidget {
  const MainProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return _buildPortraitLayout();
    } else {
      return _buildLandscapeLayout();
    }
  }
}

Scaffold _buildPortraitLayout() {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(color: Colors.cyanAccent),
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ContactImage(imagePath: 'assets/ck_cheong.jpg', name: 'CK Cheong'),
            ContactInfo(
              addressName: 'Fastwork Technologies HQ',
              addressInfo:
                  'Emporium Tower 622 Floor 24,Sukhumvit Rd, Khlong Toei, Bangkok 10110',
              email: 'ck@fastwork.co',
              phone: '(012) 345 6789',
            ),
            Ratings(defaultColor: Colors.black, ratingColor: Colors.green),
          ],
        ),
      ),
    ),
  );
}

Scaffold _buildLandscapeLayout() {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(color: Colors.cyanAccent),
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContactImage(
                    imagePath: 'assets/ck_cheong.jpg',
                    name: 'CK Cheong',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContactInfo(
                    addressName: 'Fastwork Technologies HQ',
                    addressInfo:
                        'Emporium Tower 622 Floor 24,Sukhumvit Rd, Khlong Toei, Bangkok 10110',
                    email: 'ck@fastwork.co',
                    phone: '(012) 345 6789',
                  ),
                  Ratings(
                    defaultColor: Colors.black,
                    ratingColor: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

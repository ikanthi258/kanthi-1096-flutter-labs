import 'package:flutter/material.dart';
import 'package:kanthi_widgets_exercises/components/contact_image.dart';
import 'package:kanthi_widgets_exercises/components/contact_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/interactive_ratings.dart';

class ProfileCardResponsive extends StatelessWidget {
  final SharedPreferencesWithCache prefs;

  const ProfileCardResponsive({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _buildPortraitLayout(context);
        } else {
          return _buildLandscapeLayout(context);
        }
      },
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.cyanAccent),
        padding: EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ContactImage(
                imagePath:
                    'packages/kanthi_widgets_exercises/assets/ck_cheong.jpg',
                name: 'CK Cheong',
              ),
              ContactInfo(
                addressName: 'Fastwork Technologies HQ',
                addressInfo:
                    'Emporium Tower 622 Floor 24,Sukhumvit Rd, Khlong Toei, Bangkok 10110',
                email: 'ck@fastwork.co',
                phone: '(012) 345 6789',
              ),
              InteractiveRatings(
                prefs: prefs,
                activeColor: colorScheme.primary,
                inactiveColor: colorScheme.outlineVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
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
                      imagePath:
                          'packages/kanthi_widgets_exercises/assets/ck_cheong.jpg',
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
                    InteractiveRatings(
                      prefs: prefs,
                      activeColor: colorScheme.primary,
                      inactiveColor: colorScheme.outlineVariant,
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
}

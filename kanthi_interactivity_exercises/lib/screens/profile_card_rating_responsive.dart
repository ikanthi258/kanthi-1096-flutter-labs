import 'package:flutter/material.dart';
import 'package:kanthi_widgets_exercises/components/contact_image.dart';
import 'package:kanthi_widgets_exercises/components/contact_info.dart';
import '../components/interactive_ratings.dart';

class ProfileCardRatingResponsive extends StatelessWidget {
  const ProfileCardRatingResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return _buildPortraitLayout(context);
    } else {
      return _buildLandscapeLayout(context);
    }
  }
}

Widget _buildPortraitLayout(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
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
              activeColor: Theme.of(context).colorScheme.primary,
              inactiveColor: Theme.of(context).colorScheme.outlineVariant,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildLandscapeLayout(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
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
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveColor: Theme.of(context).colorScheme.outlineVariant,
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

import 'package:flutter/material.dart';
import '../components/contact_image.dart';
import '../components/contact_info.dart';
import '../components/ratings.dart';

class ProfileCardRating extends StatelessWidget {
  const ProfileCardRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.blue.shade100),
        padding: EdgeInsets.all(20),
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
    );
  }
}

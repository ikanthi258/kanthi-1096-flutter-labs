import 'package:flutter/material.dart';
import '../components/pet_card.dart';

class PetsScreen extends StatelessWidget {
  const PetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Pet App')),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 250,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 90,
              children: [
                PetCard(
                  name: 'bird',
                  imgURL:
                      'https://www.birds.cornell.edu/home/wp-content/uploads/2023/09/334289821-Baltimore_Oriole-Matthew_Plante.jpg',
                ),
                PetCard(
                  name: 'bird',
                  imgURL:
                      'https://www.birds.cornell.edu/home/wp-content/uploads/2023/09/334289821-Baltimore_Oriole-Matthew_Plante.jpg',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 90,
              children: [
                PetCard(
                  name: 'bird',
                  imgURL:
                      'https://www.birds.cornell.edu/home/wp-content/uploads/2023/09/334289821-Baltimore_Oriole-Matthew_Plante.jpg',
                ),
                PetCard(
                  name: 'bird',
                  imgURL:
                      'https://www.birds.cornell.edu/home/wp-content/uploads/2023/09/334289821-Baltimore_Oriole-Matthew_Plante.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

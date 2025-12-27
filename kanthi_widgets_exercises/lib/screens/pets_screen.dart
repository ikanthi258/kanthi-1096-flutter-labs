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
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PetCard(
                      name: 'Bird',
                      imgURL:
                          'https://www.birds.cornell.edu/home/wp-content/uploads/2023/09/334289821-Baltimore_Oriole-Matthew_Plante.jpg',
                    ),
                  ),
                  Expanded(
                    child: PetCard(
                      name: 'Dog',
                      imgURL:
                          'https://as2.ftcdn.net/v2/jpg/01/17/57/05/1000_F_117570590_2kHuKdli3fA5xE3JVw2C1EjTIqvYckDU.jpg',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: PetCard(
                      name: 'Cat',
                      imgURL:
                          'https://as1.ftcdn.net/v2/jpg/04/20/60/72/1000_F_420607215_RCvCteFVtZYmmutVuSu6uGzcmV2ivYtD.jpg',
                    ),
                  ),
                  Expanded(
                    child: PetCard(
                      name: 'Rabbit',
                      imgURL:
                          'https://as2.ftcdn.net/v2/jpg/01/71/07/15/1000_F_171071581_cDfHOS1v2eSAr9Qe7imhc5iy20TC8KFb.jpg',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

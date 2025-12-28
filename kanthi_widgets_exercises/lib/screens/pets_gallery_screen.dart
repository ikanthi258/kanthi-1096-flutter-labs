import 'package:flutter/material.dart';
import 'package:kanthi_first_app_test/components/pet_card_with_model.dart';
import '../models/pet_model.dart';

void main() {
  runApp(PetsGalleryScreen());
}

class PetsGalleryScreen extends StatelessWidget {
  const PetsGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pet Gallery')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Bird',
                    imageURL:
                        'https://www.birds.cornell.edu/home/wp-content/uploads/2023/09/334289821-Baltimore_Oriole-Matthew_Plante.jpg',
                  ),
                ),
              ),
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Dog',
                    imageURL:
                        'https://as2.ftcdn.net/v2/jpg/01/17/57/05/1000_F_117570590_2kHuKdli3fA5xE3JVw2C1EjTIqvYckDU.jpg',
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Cat',
                    imageURL:
                        'https://as1.ftcdn.net/v2/jpg/04/20/60/72/1000_F_420607215_RCvCteFVtZYmmutVuSu6uGzcmV2ivYtD.jpg',
                    textColor: Colors.yellow,
                  ),
                ),
              ),
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Rabbit',
                    imageURL:
                        'https://as2.ftcdn.net/v2/jpg/01/71/07/15/1000_F_171071581_cDfHOS1v2eSAr9Qe7imhc5iy20TC8KFb.jpg',
                    backgroundColor: Colors.redAccent,
                    textColor: Colors.greenAccent,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

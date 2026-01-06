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
                        'https://ichef.bbci.co.uk/news/976/cpsprodpb/67CF/production/_108857562_mediaitem108857561.jpg',
                  ),
                ),
              ),
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Dog',
                    imageURL:
                        'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg',
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
                        'https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_960_720.jpg',
                    textColor: Colors.yellow,
                  ),
                ),
              ),
              Expanded(
                child: PetCardWithModel(
                  pet: PetModel(
                    name: 'Rabbit',
                    imageURL:
                        'https://cdn.pixabay.com/photo/2019/09/19/06/09/peter-rabbit-4488325_1280.jpg',
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

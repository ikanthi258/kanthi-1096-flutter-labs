import 'package:flutter/material.dart';

Widget _submitButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: const Text('Are you sure you want to submit?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    },
    child: const Text(
      'Submit',
      style: TextStyle(fontSize: 34, fontWeight: FontWeight.normal),
    ),
  );
}

Widget textBar(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text(
        'CK Cheong',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      Text(
        '123-456-7890',
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

class ProfileWithButton extends StatelessWidget {
  const ProfileWithButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          textBar(context),
          AspectRatio(
            aspectRatio: 1,
            child: Image.asset('assets/ck_cheong.jpg', fit: BoxFit.cover),
          ),
          Text(
            'Photo credit: FB CK Cheong',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          _submitButton(context),
        ],
      ),
    );
  }
}

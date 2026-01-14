import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  final String addressName;
  final String addressInfo;
  final String email;
  final String phone;
  const ContactInfo({
    super.key,
    required this.addressName,
    required this.addressInfo,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                addressName,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(addressInfo),
              leading: Icon(Icons.apartment, color: Colors.blue[500]),
            ),
            const Divider(),
            ListTile(
              title: Text(phone, style: TextStyle(fontWeight: FontWeight.w500)),
              leading: Icon(Icons.contact_phone, color: Colors.blue[500]),
            ),
            ListTile(
              title: Text(email),
              leading: Icon(Icons.contact_mail, color: Colors.blue[500]),
            ),
          ],
        ),
      ),
    );
  }
}

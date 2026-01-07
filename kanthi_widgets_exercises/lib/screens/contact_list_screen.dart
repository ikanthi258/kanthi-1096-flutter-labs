import 'package:flutter/material.dart';
import '../models/contact_model.dart';

void main() {
  runApp(ContactListScreen());
}

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});
  @override
  ContactListState createState() => ContactListState();
}

class ContactListState extends State<ContactListScreen> {
  final List<Contact> _contacts = [
    Contact(name: "John Doe", phoneNumber: "123-456-7890"),
    Contact(name: "Jane Smith", phoneNumber: "987-654-3210"),
    Contact(name: "Alice Johnson", phoneNumber: "555-555-5555"),
  ];
  int _counter = 1;

  void _addContact() {
    setState(() {
      _contacts.add(
        Contact(
          name: "New Contact $_counter",
          phoneNumber: "000-000-${_counter.toString().padLeft(4, '0')}",
        ),
      );
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF6ED),
      appBar: AppBar(
        title: const Text(
          'My Contacts',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFFF5ED),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 4.0)],
            ),

            child: ListTile(
              title: Text(
                _contacts[index].name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                _contacts[index].phoneNumber,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(padding: EdgeInsets.symmetric(vertical: 5));
        },
        itemCount: _contacts.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addContact();
        },
        tooltip: "Add one more contact",
        child: const Icon(Icons.add),
      ),
    );
  }
}

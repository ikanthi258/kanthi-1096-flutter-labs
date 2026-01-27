// ============================================
// A custom widget MainFacultyList
//
// AI DOCUMENTATION
// No AI tools were used for this file.
// All code written independently.
//
// This code showing faculties list by using ListView and user
// can interact by click on each faculty and application will
// navigate user to faculty detail and image of each.
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2026-01-27
// ============================================
import 'package:flutter/material.dart';
import 'package:kanthi_first_app_test/screens/faculty_detail.dart';
import 'models/faculty_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KKU Faculty',

      // Dark Theme Configuration
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent,
          brightness: Brightness.dark,
        ),
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.redAccent,
          brightness: Brightness.light,
        ),
      ),
      themeMode: ThemeMode.system,

      home: MainFacultyList(),
    );
  }
}

class MainFacultyList extends StatefulWidget {
  const MainFacultyList({super.key});

  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<MainFacultyList> {
  final List<FacultyModel> facultyData = [
    const FacultyModel(
      name: 'Engineering',
      description: 'https://www.en.kku.ac.th/web/',
      imageUrl: 'assets/faculties/engineering.png',
      thaiName: 'วิศวกรรมศาสตร์',
    ),
    const FacultyModel(
      name: 'Medicine',
      description: 'https://md.kku.ac.th/',
      imageUrl: 'assets/faculties/medicine.png',
      thaiName: 'แพทยศาสตร์',
    ),
    const FacultyModel(
      name: 'Architecture',
      description: 'https://apds.kku.ac.th/',
      imageUrl: 'assets/faculties/architecture.png',
      thaiName: 'สถาปัตยกรรมศาสตร์',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('KKU Faculties')),
      body: ListView.builder(
        itemCount: facultyData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.arrow_right),
              title: Text(facultyData[index].name),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        FacultyDetail(facultyModel: facultyData[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

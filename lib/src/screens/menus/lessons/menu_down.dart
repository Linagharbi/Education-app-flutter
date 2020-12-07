import 'package:education_app/src/screens/menus/lessons/CoursePage.dart';
import 'package:education_app/src/screens/menus/lessons/DevoirsPage.dart';
import 'package:education_app/src/screens/menus/lessons/ExercicesPage.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _currentIndex = 0;

  final tabs = [
    CoursePage(),
    ExercicePage(),
    DevoirsPage(),
    // CoursePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            // ignore: deprecated_member_use
            title: Text('Cours'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste),
            // ignore: deprecated_member_use
            title: Text('Exercices'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chrome_reader_mode),
            // ignore: deprecated_member_use
            title: Text('Devoirs'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

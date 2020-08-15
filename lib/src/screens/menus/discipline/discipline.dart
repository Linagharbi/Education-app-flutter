import 'package:education_app/src/screens/menus/exams.dart';
import 'package:education_app/src/screens/menus/payment.dart';
import 'package:education_app/src/screens/menus/results.dart';
import 'package:flutter/material.dart';

class Discipline extends StatefulWidget {
  @override
  _DisciplineState createState() => _DisciplineState();
}

class _DisciplineState extends State<Discipline> {
  int _currentIndex = 0;

  final tabs = [
    Payment(),
    Exams(),
    Results(),
    Payment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            title: Text('Retards'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_off),
            title: Text('Absences'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Blames'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning), //perm_identity
            title: Text('Avertiss.'),
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

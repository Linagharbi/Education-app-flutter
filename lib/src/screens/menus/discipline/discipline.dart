import 'package:education_app/src/screens/menus/discipline/absences/absences.dart';
import 'package:education_app/src/screens/menus/discipline/blames/blames.dart';
import 'package:education_app/src/screens/menus/discipline/delays/delays.dart';
import 'package:education_app/src/screens/menus/discipline/warnings/warnings.dart';
import 'package:flutter/material.dart';

class Discipline extends StatefulWidget {
  @override
  _DisciplineState createState() => _DisciplineState();
}

class _DisciplineState extends State<Discipline> {
  int _currentIndex = 0;

  final tabs = [
    Delays(),
    Absences(),
    Blames(),
    Warnings(),
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
            // ignore: deprecated_member_use
            title: Text('Retards'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm_off),
            // ignore: deprecated_member_use
            title: Text('Absences'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            // ignore: deprecated_member_use
            title: Text('Blâmes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning), //perm_identity
            // ignore: deprecated_member_use
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

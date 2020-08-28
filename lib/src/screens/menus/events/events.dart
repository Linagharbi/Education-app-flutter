import 'package:education_app/src/screens/menus/events/events_home/clubs_home.dart';
import 'package:education_app/src/screens/menus/events/events_home/events_home.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  int _currentIndex = 0;

  final tabs = [
    EventsHome(),
    ClubsHome(),
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
            icon: Icon(Icons.event_note),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.palette), //perm_identity
            title: Text('Club'),
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

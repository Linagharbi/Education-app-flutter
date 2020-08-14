import 'package:education_app/src/screens/menus/payment/payment.dart';
import 'package:education_app/src/screens/menus/payment/tranche/tranches_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final tabs = [
    ProductsScreen(),
    Payment(),
    ProductsScreen(),
    Payment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // To avoid causing a re-build of the selected widget
      body: IndexedStack(
        index: _currentIndex,
        children: tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 25,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Scolaire'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            title: Text('Cantine'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            title: Text('Bus'),
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

import 'package:education_app/src/screens/menus/payment/payment_body.dart';
import 'package:education_app/src/screens/menus/payment/tranche/tranches_screen.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int _currentIndex = 0;

  final tabs = [
    ProductsScreen(),
    PaymentBody(),
    ProductsScreen(),
    PaymentBody(),
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

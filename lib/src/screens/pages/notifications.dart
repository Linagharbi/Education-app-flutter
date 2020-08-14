import 'package:education_app/src/screens/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[900],
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: Text(
              "Your Notifications",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
            ),
          ),
        ),
      ),
    );
  }
}

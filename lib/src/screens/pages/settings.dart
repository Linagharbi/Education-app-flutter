import 'package:education_app/src/screens/bloc_navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Your Settings",
        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28),
      ),
    );
  }
}

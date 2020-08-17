import 'package:education_app/src/screens/menus/discipline/delays/delay_item.dart';
import 'package:education_app/src/screens/menus/discipline/gradient_app_bar.dart';
import 'package:flutter/material.dart';

class Delays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Retards",
        gradientBegin: Colors.red[200],
        gradientEnd: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            DelayDetail(),
            DelayDetail(),
            DelayDetail(),
            DelayDetail(),
            DelayDetail(),
            DelayDetail(),
          ],
        ),
      ),
    );
  }
}

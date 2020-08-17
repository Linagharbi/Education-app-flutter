import 'package:education_app/src/screens/menus/discipline/gradient_app_bar.dart';
import 'package:education_app/src/screens/menus/discipline/warnings/warning_detail.dart';
import 'package:flutter/material.dart';

class Warnings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Avertissements",
        gradientBegin: Colors.red[200],
        gradientEnd: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WarningDetail(),
            WarningDetail(),
          ],
        ),
      ),
    );
  }
}

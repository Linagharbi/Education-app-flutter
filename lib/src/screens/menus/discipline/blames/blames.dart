import 'package:education_app/src/screens/menus/discipline/blames/blame_detail.dart';
import 'package:education_app/src/screens/menus/discipline/gradient_app_bar.dart';
import 'package:flutter/material.dart';

class Blames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Blâmes",
        gradientBegin: Colors.red[200],
        gradientEnd: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlameDetail(),
            BlameDetail(),
            BlameDetail(),
          ],
        ),
      ),
    );
  }
}

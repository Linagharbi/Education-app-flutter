import 'package:education_app/src/screens/menus/discipline/absences/absence_item.dart';
import 'package:education_app/src/screens/menus/discipline/gradient_app_bar.dart';
import 'package:flutter/material.dart';

class Absences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Absences",
        gradientBegin: Colors.red[200],
        gradientEnd: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AbsenceDetail(),
            AbsenceDetail(),
            AbsenceDetail(),
            AbsenceDetail(),
            AbsenceDetail(),
          ],
        ),
      ),
    );
  }
}

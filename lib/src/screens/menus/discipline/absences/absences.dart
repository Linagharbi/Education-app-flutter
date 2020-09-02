import 'package:education_app/src/models/discipline/absence.dart';
import 'package:education_app/src/providers/children.dart';
import 'package:education_app/src/screens/menus/discipline/absences/absence_item.dart';
import 'package:education_app/src/screens/menus/discipline/dropdown_discipline.dart';
import 'package:education_app/src/screens/menus/discipline/gradient_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Absences extends StatelessWidget {
  Widget _buildListView(Children children) {
    List<Absence> myAbsences = children.selectedStudent.absences;

    if (myAbsences.isEmpty) {
      return Center(
        child: Text("No absences!"),
      );
    }

    return ListView.builder(
      // here we use our demo tranches list
      itemCount: myAbsences.length,
      itemBuilder: (context, index) => AbsenceDetail(
        itemIndex: index,
        absence: myAbsences[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Absences",
        gradientBegin: Colors.red[200],
        gradientEnd: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: DropDownDiscipline(),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Consumer<Children>(
              builder: (context, children, child) => _buildListView(children),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:education_app/src/models/discipline/warning.dart';
import 'package:education_app/src/providers/children.dart';
import 'package:education_app/src/screens/menus/discipline/dropdown_discipline.dart';
import 'package:education_app/src/screens/menus/discipline/gradient_app_bar.dart';
import 'package:education_app/src/screens/menus/discipline/warnings/warning_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Warnings extends StatelessWidget {
  Widget _buildListView(Children children) {
    List<Warning> myWarning = children.selectedStudent.avertissements;

    if (myWarning.isEmpty) {
      return Center(
        child: Text("No Warning!"),
      );
    }

    return ListView.builder(
      // here we use our demo tranches list
      itemCount: myWarning.length,
      itemBuilder: (context, index) => WarningDetail(
        itemIndex: index,
        warning: myWarning[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Avertissements",
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

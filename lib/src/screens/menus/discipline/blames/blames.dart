import 'package:education_app/src/models/discipline/blame.dart';
import 'package:education_app/src/providers/children.dart';
import 'package:education_app/src/screens/menus/discipline/blames/blame_detail.dart';
import 'package:education_app/src/screens/menus/discipline/dropdown_discipline.dart';
import 'package:education_app/src/screens/menus/discipline/gradient_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Blames extends StatelessWidget {
  Widget _buildListView(Children children) {
    List<Blame> myBlames = children.selectedStudent.blames;

    if (myBlames.isEmpty) {
      return Center(
        child: Text("No blames!"),
      );
    }

    return ListView.builder(
      // here we use our demo tranches list
      itemCount: myBlames.length,
      itemBuilder: (context, index) => BlameDetail(
        itemIndex: index,
        blame: myBlames[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Blâmes",
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

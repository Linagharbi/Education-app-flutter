import 'package:education_app/src/models/discipline/delay.dart';
import 'package:education_app/src/providers/children.dart';
import 'package:education_app/src/screens/menus/discipline/delays/delay_item.dart';
import 'package:education_app/src/screens/menus/discipline/dropdown_discipline.dart';
import 'package:education_app/src/screens/menus/discipline/gradient_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Delays extends StatelessWidget {
  Widget _buildListView(Children children) {
    List<Delay> myDelays = children.selectedStudent.retards;

    if (myDelays.isEmpty) {
      return Center(
        child: Text("No delays!"),
      );
    }

    return ListView.builder(
      // here we use our demo tranches list
      itemCount: myDelays.length,
      itemBuilder: (context, index) => DelayDetail(
        itemIndex: index,
        delay: myDelays[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Retards",
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

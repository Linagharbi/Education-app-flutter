import 'package:education_app/src/utils/format_string.dart';
import 'package:education_app/src/providers/children.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownDiscipline extends StatefulWidget {
  @override
  _DropDownDisciplineState createState() => _DropDownDisciplineState();
}

class _DropDownDisciplineState extends State<DropDownDiscipline> {
  Children myChildren;
  List<String> children = [];
  String selectedChild;

  @override
  void initState() {
    super.initState();

    // Build the dropdown & set the selected child in UI and in provider
    myChildren = Provider.of<Children>(context, listen: false);
    children = myChildren.list
        .map(
          (child) => child.nomPrenomFr.toCamelCase(),
        )
        .toList();

    // By default show the first child name, else show selected
    if (myChildren.selectedStudent == null) {
      selectedChild = myChildren.list[0].nomPrenomFr.toCamelCase();
    } else {
      selectedChild = myChildren.selectedStudent.nomPrenomFr.toCamelCase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(
        "Selectionnez un enfant",
        style: TextStyle(
          color: Colors.black26,
        ),
      ),
      icon: Icon(
        // Add this
        Icons.arrow_drop_down, // Add this
        color: Colors.black26, // Add this
      ),
      value: selectedChild,
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
      selectedItemBuilder: (selectedChild != null)
          ? (BuildContext context) {
              return children.map<Widget>(
                (String value) {
                  return Center(
                    child: Text(
                      selectedChild,
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              ).toList();
            }
          : null,
      items: children.map((item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedChild = value;
          myChildren.setStudent(myChildren.list[(children.indexOf(value))]);
        });
      },
    );
  }
}

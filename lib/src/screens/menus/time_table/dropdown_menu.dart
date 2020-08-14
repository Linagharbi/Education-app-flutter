import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  @override
  _DropDownMenuState createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  // ignore: todo
  // TODO: Pass children list as provider to whole widgets
  final List<String> children = [
    "Mansour Ben Selmene",
    "Mahdi Ben Selmene",
    "Sarra Ben Selmene"
  ];
  String selectedChild;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(
        "Select child",
        style: TextStyle(
          color: Color(0xFF8e7daf),
        ),
      ),
      icon: Icon(
        // Add this
        Icons.arrow_drop_down, // Add this
        color: Colors.white, // Add this
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
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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
        });
      },
    );
  }
}

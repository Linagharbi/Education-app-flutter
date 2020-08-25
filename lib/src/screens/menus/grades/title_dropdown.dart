import 'package:flutter/material.dart';

class TitleDropDown extends StatefulWidget {
  @override
  _TitleDropDownState createState() => _TitleDropDownState();
}

class _TitleDropDownState extends State<TitleDropDown> {
  final List<String> subjects = [
    "Mathématiques",
    "Sciences Vie et Terre",
    "Sciences Physiques et Chimie"
  ];
  String selectedChild;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: DropdownButton<String>(
        underline: Container(),
        hint: Text(
          "Choisir une matière",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        value: selectedChild,
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        selectedItemBuilder: (selectedChild != null)
            ? (BuildContext context) {
                return subjects.map<Widget>(
                  (String value) {
                    return Container(
                      alignment: Alignment.center,
                      child: Text(
                        selectedChild,
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    );
                  },
                ).toList();
              }
            : null,
        items: subjects.map((item) {
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
      ),
    );
  }
}

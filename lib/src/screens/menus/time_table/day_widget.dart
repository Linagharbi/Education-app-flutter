import 'package:education_app/src/models/radio.dart';
import 'package:education_app/src/screens/menus/time_table/table_styles.dart';
import 'package:flutter/material.dart';

class DayWidget extends StatelessWidget {
  final RadioModel _item;
  DayWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      // If current day, use current day style
      // else if selected day, use selected day style
      decoration: _item.isCurrent
          ? kCurrentDayBox
          : (_item.isSelected ? kSelectedBox : null),
      padding: EdgeInsets.all(8),
      child: Text(
        _item.text,
        style: _item.isCurrent
            ? kSelectedText
            : (_item.isSelected ? kSelectedText : kUnSelectedText),
      ),
    );
  }
}

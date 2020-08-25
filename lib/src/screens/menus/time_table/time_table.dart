import 'package:education_app/src/models/radio.dart';
import 'package:education_app/src/screens/menus/time_table/day_widget.dart';
import 'package:education_app/src/screens/menus/time_table/session_widget.dart';
import 'package:education_app/src/screens/menus/time_table/top_row.dart';
import 'package:education_app/src/utils/datetime_methods.dart';
import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  final List<RadioModel> myDays = [
    // Index 0 (Sunday) not included
    RadioModel(false, 'MON', DateTimeMethods().isCurrentDay(1)),
    RadioModel(false, 'TUE', DateTimeMethods().isCurrentDay(2)),
    RadioModel(false, 'WED', DateTimeMethods().isCurrentDay(3)),
    RadioModel(false, 'THU', DateTimeMethods().isCurrentDay(4)),
    RadioModel(false, 'FRI', DateTimeMethods().isCurrentDay(5)),
    RadioModel(false, 'SAT', DateTimeMethods().isCurrentDay(6)),
  ];

  // ignore: todo
  // TODO: Pass function to top row to update on change
  // String selectedChild;
  int tabIndex = DateTimeMethods().weekDayInt;

  Widget _buildTabWithIndex() {
    return Column(
      children: [
        // Text('Table for day: $tabIndex'),
        SessionWidget(
          startTime: "8:00",
          endTime: "9:00",
          subject: "Mathématiques",
          location: "TP-08",
          teacher: "Moncef Ben Ammar",
        ),
        SessionWidget(
          startTime: "9:00",
          endTime: "9:55",
          subject: "Histoire",
          location: "105",
          teacher: "Sameh Trabelsi",
        ),
        SessionWidget(
          startTime: "10:05",
          endTime: "11:00",
          subject: "Physique et Chimie",
          location: "TP-08",
          teacher: "Salima Mart Mo5tar",
        ),
        SessionWidget(
          startTime: "11:00",
          endTime: "12:00",
          subject: "Sports",
          location: "Terrain",
          teacher: "Salim Jarkom",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.purple[900],
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0xFF5b418f),
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TopRow(),
                      Padding(
                        padding: EdgeInsets.only(top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: myDays.asMap().entries.map((entry) {
                            int index = entry.key;
                            RadioModel day = entry.value;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  myDays.forEach(
                                    (element) => element.isSelected = false,
                                  );
                                  myDays[index].isSelected = true;
                                  tabIndex = index + 1;
                                });
                              },
                              child: DayWidget(day),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: _buildTabWithIndex(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

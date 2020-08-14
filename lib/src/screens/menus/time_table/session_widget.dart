import 'package:flutter/material.dart';

class SessionWidget extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String subject;
  final String location;
  final String teacher;

  SessionWidget({
    this.startTime,
    this.endTime,
    this.subject,
    this.location,
    this.teacher,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text(
                startTime,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Lines(
                lines: [20, 30, 40, 10],
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFF654f91),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 4),
              color: Color(0xFFfcf9f5),
              padding: EdgeInsets.only(
                left: 16,
                top: 8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "$startTime - $endTime",
                          style: TextStyle(fontSize: 14),
                        ),
                        VerticalDivider(),
                        Text("Salle: $location"),
                      ],
                    ),
                  ),
                  // Expanded: To avoid overflow of long subject
                  Expanded(
                    child: Text(
                      subject,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(teacher),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Lines extends StatelessWidget {
  final List<double> lines;
  Lines({this.lines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        4,
        (index) => Container(
          width: lines[index],
          height: 2.0,
          color: Color(0xFFd0d2d8),
          margin: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}

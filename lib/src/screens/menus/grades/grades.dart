import 'package:education_app/src/screens/menus/grades/grades_app_bar.dart';
import 'package:flutter/material.dart';

class Grades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        // fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          // Container(),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: GradesAppBar(
              title: "Notes",
              gradientBegin: Colors.red[200],
              gradientEnd: Colors.red,
            ),
          ),
          Positioned(
            top: 110,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              // width: set by left & right
              height: 50,
              padding: EdgeInsets.all(10),
              child: Text("Hello"),
            ),
          ),
          Positioned(
            top: 175,
            left: 20,
            right: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              // width: set by left & right
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: DataTable(
                            headingRowHeight: 0,
                            columnSpacing: 5,
                            columns: [
                              DataColumn(label: Text('')),
                              DataColumn(label: Text('')),
                              DataColumn(label: Text('')),
                              DataColumn(label: Text('')),
                            ],
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '1 Mars',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        'Mathematiques',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '19.5',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        'T.Bien',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

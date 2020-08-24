import 'package:education_app/src/screens/menus/grades/grades_app_bar.dart';
import 'package:flutter/material.dart';

class Grades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // appBar: GradesAppBar(
      //   title: "Grades",
      //   gradientBegin: Colors.red[200],
      //   gradientEnd: Colors.red,
      // ),
      body: Stack(
        // fit: StackFit.expand,
        overflow: Overflow.visible,
        children: <Widget>[
          // Container(),
          Positioned(
            top: 0.0,
            left: 0.0,
            child: GradesAppBar(
              title: "Grades",
              gradientBegin: Colors.red[200],
              gradientEnd: Colors.red,
            ),
          ),
          Positioned(
            top: 115,
            left: MediaQuery.of(context).size.width / 2 -
                MediaQuery.of(context).size.width * 0.9 / 2,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
            ),
          ),
          Positioned(
            top: 180,
            left: MediaQuery.of(context).size.width / 2 -
                MediaQuery.of(context).size.width * 0.9 / 2,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width * 0.9,
              child: DataTable(
                headingRowHeight: 0,
                columns: [
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text('Dash')),
                    DataCell(Text('2018')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Gopher')),
                    DataCell(Text('2009')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Last line')),
                    DataCell(Text('1980')),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

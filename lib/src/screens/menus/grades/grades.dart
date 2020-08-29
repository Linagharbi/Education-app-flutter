import 'package:education_app/src/models/subject.dart';
import 'package:education_app/src/screens/menus/grades/grades_app_bar.dart';
import 'package:flutter/material.dart';

class Grades extends StatelessWidget {
  // ignore: todo
  // TODO: Use Fetched List
  final List<Subject> mySubjects = [
    Subject(
      date: '1 Mars',
      name: "Controle 1",
      amount: 13.25,
    ),
    Subject(
      date: '15 Mars',
      name: "Controle 2",
      amount: 16,
    ),
    Subject(
      date: '1 Mars',
      name: "Synthèse 1",
      amount: 19.75,
    ),
    Subject(
      date: '15 Mars',
      name: "Synthèse 2",
      amount: 20,
    ),
  ];

  Widget _buildRow(Subject mySubject) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(
              mySubject.date,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              mySubject.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              mySubject.amount.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
              gradientBegin: Colors.deepPurple[200],
              gradientEnd: Colors.deepPurple,
            ),
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              // width: set by left & right
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Type du devoir',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'Note',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 165,
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
                      delegate: SliverChildListDelegate(
                        [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Column(
                                children: mySubjects
                                    .map(
                                      (subject) => _buildRow(subject),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
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

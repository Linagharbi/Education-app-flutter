import 'package:education_app/src/models/student.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Children with ChangeNotifier {
  BuildContext context;
  List<Student> list = [];
  Student selectedStudent;

  Children(this.context);

  void setStudent(Student student) {
    selectedStudent = student;
    notifyListeners();
  }

  void setChildren(List<Student> newList) {
    list = newList;
  }
}

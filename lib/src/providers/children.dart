import 'package:education_app/src/models/student.dart';
import 'package:education_app/src/services/http_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Children with ChangeNotifier {
  final HttpService _httpService = HttpService();
  List<Student> list = [];
  Student selectedStudent;

  // Initalizer (called elsewhere)
  Future<List<Student>> getTheChildren(int parentId) async {
    list = await _httpService.getChildren(parentId);
    selectedStudent = list[0];
    return list;
  }

  //-----------------Methods-----------------------//
  void setStudent(Student student) {
    selectedStudent = student;
    notifyListeners();
  }

  void setChildren(List<Student> newList) {
    list = newList;
  }
}

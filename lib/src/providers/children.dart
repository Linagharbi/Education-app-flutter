import 'package:education_app/src/models/student.dart';
import 'package:education_app/src/providers/logged_user.dart';
import 'package:education_app/src/services/http_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Children with ChangeNotifier {
  final HttpService _httpService = new HttpService();

  BuildContext context;
  List<Student> list = [];
  Student selectedStudent;

  Children(this.context);

  void setStudent(Student student) {
    selectedStudent = student;
    notifyListeners();
  }

  // Used to build the list of children from api
  // No strong typing since list is not needed when building
  Future buildChildren() async {
    LoggedUser loggedUser = Provider.of<LoggedUser>(context, listen: false);
    list = await _httpService.getChildren(loggedUser.info.id);
    notifyListeners();
    return list;
  }
}

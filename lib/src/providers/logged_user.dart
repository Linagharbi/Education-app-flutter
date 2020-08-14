import 'package:education_app/src/models/user.dart';
import 'package:flutter/foundation.dart';

// Provides the logged user (which is shared across all widgets)
class LoggedUser with ChangeNotifier {
  User info;

  void setUser(User newUser) {
    info = newUser;
    notifyListeners();
  }
}

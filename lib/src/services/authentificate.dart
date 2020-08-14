import 'package:education_app/src/models/user.dart';
import 'package:education_app/src/providers/logged_user.dart';
import 'package:education_app/src/services/firestore_db.dart';
import 'package:education_app/src/services/http_service.dart';
import 'package:education_app/src/services/push_notification.dart';
import 'package:flutter/material.dart';

// import 'package:education_app/globals.dart' as globals;
import 'package:provider/provider.dart';

class Authentificate {
  final HttpService _httpService = new HttpService();
  final NotifService _notif = NotifService();
  final FireStoreDBService _fireStoreDBService = FireStoreDBService();

  Future<User> getUserFromCreds(String email, String password) async {
    List<User> users = await _httpService.getAllUsers();
    if (users != null) {
      for (User user in users) {
        if (user.email == email || user.login == email) {
          print("Found a matching email! ");
          if (user.password == password) {
            print("Credentials accepted! Logging in");
            return user;
          }
        }
      }
    }
    return null;
  }

  // Validate Email
  bool isValidEmail(String email) {
    if (email == null || email == "")
      return false;
    else
      return true;
  }

  // Validate Password
  bool isValidPassword(String password) {
    if (password == null || password == "")
      return false;
    else
      return true;
  }

  void startAuth(
    String email,
    String password,
    BuildContext context,
  ) async {
    if (isValidEmail(email) && isValidPassword(password)) {
      // Valid credentials
      print("Email: $email");
      print("Password: $password");

      // DEVONLY:
      User myUser = new User(
        id: 999,
        firstName: "admin",
        lastName: "admin",
        email: "admin@admin.com",
        login: "admin",
        password: "admin",
        nature: "parent",
      );

      // FIXME: Use this in production
      // // Check connection to website before proceeding any further
      // if (!(await _httpService.checkConnection())) {
      //   displayAlert(
      //     context,
      //     "Connection error",
      //     "An issue occured while connecting to the server",
      //   );
      //   return;
      // }
      // // Get the user with the correct credentials
      // User myUser = await getUserFromCreds(email, password);
      // FIXME: Use this in production
      final loggedUser = Provider.of<LoggedUser>(context, listen: false);
      loggedUser.setUser(myUser);
      // globals.setLoggedUser(myUser);

      // If myUser is not null then navigate to main
      // and pass the user as parameter
      if (myUser != null && myUser.nature != null) {
        // Sub to topic and store the token
        _notif.subToTopic(myUser.nature);
        _fireStoreDBService.updateUserToken(myUser.id);

        // Change the view
        Navigator.pushReplacementNamed(context, "/main");
      } else {
        displayAlert(context, "Invalid credentials", "Wrong email or password");
      }
    } else {
      // Invalid credentials
      displayAlert(context, 'Wrong Format', 'Wrong email or password format');
    }
  }

  Future logOut(BuildContext context, String myTopic) async {
    _notif.unsubFromTopic(myTopic);
    Navigator.pushReplacementNamed(context, "/login");
  }

  void displayAlert(BuildContext context, String title, String text) {
    showDialog(
      barrierDismissible: true,
      context: context,
      child: AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        elevation: 24,
      ),
    );
  }
}

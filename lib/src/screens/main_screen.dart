import 'package:education_app/src/providers/logged_user.dart';
import 'package:education_app/src/screens/sidebar/sidebar_layout.dart';
import 'package:education_app/src/services/authentificate.dart';
import 'package:flutter/material.dart';
// import 'package:education_app/globals.dart' as globals;
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  final Authentificate _auth = Authentificate();

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<LoggedUser>(context, listen: false);

    return WillPopScope(
      // Go back button logs off by default
      onWillPop: () => _auth.logOut(context, loggedUser.info.nature),
      // If MaterialApp instead of Scaffold, routes need to be re-defined
      // child: Scaffold(
      //   body: SideBarLayout(),
      // ),
      child: SideBarLayout(),
    );
  }
}

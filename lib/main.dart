import 'package:education_app/src/providers/children.dart';
import 'package:education_app/src/providers/logged_user.dart';
import 'package:education_app/src/services/push_notification.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'package:education_app/src/screens/login_screen.dart';
import 'package:education_app/src/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:education_app/src/styles/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final NotifService _notif = NotifService();

  @override
  void initState() {
    super.initState();
    _notif.initialise(); // Active notifications listener
  }

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      // Pass a MultiProvider with a list of providers
      // ! Providers must be above MaterialApp to work with navigation pop
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<LoggedUser>(
            create: (context) => LoggedUser(),
          ),
          ChangeNotifierProvider<Children>(
            create: (context) => Children(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Flutter Login UI",
          theme: basicTheme(),
          home: LoginScreen(),
          routes: {
            "/login": (_) => LoginScreen(),
            "/main": (_) => MainScreen(),
          },
        ),
      ),
    );
  }
}

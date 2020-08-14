import 'package:flutter/material.dart';

// ignore:todo
// TODO: Use theme for cleaner code
// How to use:
// Theme.of(context).textTheme.headline6

ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return base.copyWith(
      headline6: base.headline1.copyWith(
        fontFamily: 'OpenSans',
        fontSize: 22,
        color: Colors.black,
      ),
    );
  }

  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Colors.indigo,
    accentColor: Colors.amber[300],
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 20.0,
    ),
  );
}

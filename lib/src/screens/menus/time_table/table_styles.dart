import 'package:flutter/material.dart';

// User Selected Day
final kSelectedBox = BoxDecoration(
  color: Colors.deepPurple[300],
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
);

// Current Day (always has style)
final kCurrentDayBox = BoxDecoration(
  color: Colors.red,
  borderRadius: BorderRadius.all(
    Radius.circular(4),
  ),
);

// Text

final kSelectedText = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

final kUnSelectedText = TextStyle(
  color: Color(0xFF8e7daf),
);

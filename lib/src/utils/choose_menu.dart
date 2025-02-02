import 'package:education_app/src/screens/menus/events/events.dart';
import 'package:education_app/src/screens/menus/grades/grades.dart';
import 'package:education_app/src/screens/menus/lessons/lessons.dart';
import 'package:education_app/src/screens/menus/discipline/discipline.dart';
import 'package:education_app/src/screens/menus/payment/payment.dart';

import 'package:education_app/src/screens/menus/results.dart';
import 'package:education_app/src/screens/menus/time_table/time_table.dart';
import 'package:education_app/src/screens/pages/profile.dart';
import 'package:flutter/material.dart';

class MenuChoice {
  Widget getWidget(int itemId) {
    switch (itemId) {
      // Student:
      case 10: //Emlpoi
        return TimeTable();
      case 11: //Lessons
        return Lessons();
      case 12: //Exercices
        return Grades();
      case 13: //Evénements
        return Events();
      case 14: //Résultats
        return Results();

      // Parent:
      case 20: //Emploi
        return TimeTable();
      case 21: //Lessons
        return Lessons();
      case 22: //Exercices
        return Grades();
      case 23: //Evénements
        return Events();
      case 24: //Résultats
        return ProfilePage();
      case 25: //Discipline
        return Discipline();
      case 26: //Paiments
        return Payment();

      // Teacher:
      case 31: //Emploi
        return ProfilePage();
      case 32: //Cours
        return Lessons();
      case 33: //Exercices
        return ProfilePage();
      case 34: //Liste d'élèves
        return ProfilePage();

      // Default
      default: //NOT_FOUND
        print("Can't find: $itemId");
        return ProfilePage();
    }
  }
}

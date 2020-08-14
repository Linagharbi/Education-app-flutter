import 'package:intl/intl.dart';

class DateTimeMethods {
  int get weekDayInt {
    return DateTime.now().weekday;
  }

  String get weekDayFull {
    return DateFormat('EEEE').format(DateTime.now());
  }

  String get weekDayAbr {
    return DateFormat('E').format(DateTime.now());
  }

  bool isCurrentDay(int index) {
    int currentDay = DateTime.now().weekday;
    return index == currentDay;
  }
}

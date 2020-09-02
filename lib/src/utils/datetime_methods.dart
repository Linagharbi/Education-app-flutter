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

  // Day formatting
  String getDMonthY(DateTime date) {
    // ignore: todo
    // TODO: Make switch case from M (1 M only (number))
    // for french formatting
    return DateFormat('d MMMM y').format(date);
  }
}

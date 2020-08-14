import 'package:education_app/src/providers/logged_user.dart';
import 'package:education_app/src/screens/menus/time_table/dropdown_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:education_app/src/utils/format_string.dart';

class TopRow extends StatelessWidget {
  Widget _buildStudentInfo(LoggedUser user) {
    if (user.info.nature == "parent")
      return DropDownMenu();
    else
      return Text(
        "${user.info.firstName.capitalize()} ${user.info.firstName.capitalize()}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final loggedUser = Provider.of<LoggedUser>(context, listen: false);
    return Row(
      children: <Widget>[
        Row(
          children: [
            Text(
              "Classe ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "9 B 6",
              style: TextStyle(
                color: Color(0xFFa79abf),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Spacer(),
        _buildStudentInfo(loggedUser),
      ],
    );
  }
}

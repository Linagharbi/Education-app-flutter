import 'package:education_app/src/models/club.dart';
import 'package:education_app/src/screens/menus/events/events_details/club_details_background.dart';
import 'package:education_app/src/screens/menus/events/events_details/club_details_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClubDetailsPage extends StatelessWidget {
  final Club club;

  const ClubDetailsPage({Key key, this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Club>.value(
        value: club,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ClubDetailsBackground(),
            ClubDetailsContent(),
          ],
        ),
      ),
    );
  }
}

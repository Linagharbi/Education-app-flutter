import 'package:education_app/src/models/club.dart';
import 'package:education_app/src/screens/menus/events/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClubDetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final club = Provider.of<Club>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: Text(
              club.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.24),
            child: FittedBox(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    club.location,
                    style: eventLocationTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 350,
          ),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    club.duration,
                    textAlign: TextAlign.left,
                    style: eventLocationTextStyle.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (club.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                club.description,
                style: punchLine1TextStyle,
              ),
            ),
        ],
      ),
    );
  }
}

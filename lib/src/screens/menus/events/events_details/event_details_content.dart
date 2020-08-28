import 'package:education_app/src/models/event.dart';
import 'package:education_app/src/screens/menus/events/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
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
              event.title,
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
                  // Text(

                  //   style: eventLocationTextStyle.copyWith(
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    event.location,
                    style: eventLocationTextStyle.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(16),
          //   // child: RichText(
          //   //   text: TextSpan(children: [
          //   //     TextSpan(
          //   //       text: event.punchLine1,
          //   //       style: punchLine1TextStyle,
          //   //     ),
          //   //     TextSpan(
          //   //       text: event.punchLine2,
          //   //       style: punchLine2TextStyle,
          //   //     ),
          //   //   ]),
          //   // ),
          // ),
          if (event.description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                event.description,
                style: punchLine1TextStyle,
              ),
            ),
        ],
      ),
    );
  }
}

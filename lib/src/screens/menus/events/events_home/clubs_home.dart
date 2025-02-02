import 'package:education_app/src/models/club.dart';
import 'package:education_app/src/screens/menus/events/app_state.dart';
import 'package:education_app/src/screens/menus/events/events_details/club_details_page.dart';
import 'package:education_app/src/screens/menus/events/events_home/club_widget.dart';
import 'package:education_app/src/screens/menus/events/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page_background.dart';

class ClubsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: Stack(
          children: <Widget>[
            HomePageBackground(
              screenHeight: MediaQuery.of(context).size.height,
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: <Widget>[],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.keyboard_backspace,
                              color: Color(0x99FFFFFF),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "The Clubs",
                            style: fadedTextStyle,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: <Widget>[
                            for (final club in clubs.where((e) => e.categoryIds
                                .contains(appState.selectedCategoryId)))
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ClubDetailsPage(club: club),
                                    ),
                                  );
                                },
                                child: ClubWidget(
                                  club: club,
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

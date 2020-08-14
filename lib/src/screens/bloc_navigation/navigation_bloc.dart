import 'package:bloc/bloc.dart';
import 'package:education_app/src/providers/logged_user.dart';
import 'package:education_app/src/screens/pages/home.dart';
import 'package:education_app/src/screens/pages/notifications.dart';
import 'package:education_app/src/screens/pages/profile.dart';
import 'package:education_app/src/screens/pages/settings.dart';
import 'package:education_app/src/services/authentificate.dart';
import 'package:flutter/cupertino.dart';

// import 'package:education_app/globals.dart' as globals;
import 'package:provider/provider.dart';

enum NavigationEvents {
  HomeClickedEvent,
  ProfileClickedEvent,
  NotificationsClickedEvent,
  SettingsClickedEvent,
  DisconnectClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  final BuildContext context;
  NavigationBloc({this.context}) : super(HomePage());

  final Authentificate _auth = Authentificate();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.ProfileClickedEvent:
        yield ProfilePage();
        break;
      case NavigationEvents.NotificationsClickedEvent:
        yield NotificationsPage();
        break;
      case NavigationEvents.SettingsClickedEvent:
        yield SettingsPage();
        break;
      case NavigationEvents.DisconnectClickedEvent:
        final loggedUser = Provider.of<LoggedUser>(context, listen: false);
        print("Disconnecting_ID: ${loggedUser.info.id}");
        print("User nature is: ${loggedUser.info.nature}");
        _auth.logOut(context, loggedUser.info.nature);
        // _auth.logOut(context, globals.loggedUser.nature);
        break;
    }
  }
}

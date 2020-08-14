import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

class NotifService {
  final FirebaseMessaging _fcm = FirebaseMessaging();

  void initialise() {
    // Subscribe to 'all' topic by default
    _fcm.unsubscribeFromTopic('eleve');
    _fcm.unsubscribeFromTopic('enseignant');
    _fcm.unsubscribeFromTopic('etudiant');
    _fcm.subscribeToTopic('all');

    if (Platform.isIOS) {
      // Request permission if on IOS
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }

    _fcm.configure(
      // Called when the app is in the foreground and a push notif is received
      // Support "data" and "notification" json keys
      onMessage: (Map<String, dynamic> message) async {
        print("Message -Foreground- received: $message");
        displayNotif(message['data']['body']);
      },

      // Called when the app is completely closed and it's opened from
      // the push notification directly
      // ! Only updates state when "data" is passed as well --No "notification"
      onLaunch: (Map<String, dynamic> message) async {
        print("Message -Closed- received: $message");
      },

      // Called when the app is in the background and it's opened from
      // the push notification
      // ! Only updates state when "data" is passed as well --No "notification"
      onResume: (Map<String, dynamic> message) async {
        print("Message -Background- received: $message");
      },
    );
  }

  // Subscribe to a specific topic ('eleve', 'enseignant', 'parent')
  Future subToTopic(String topic) async {
    await _fcm.subscribeToTopic(topic);
    print("Subscribed to: $topic");
  }

  Future unsubFromTopic(String topic) async {
    await _fcm.unsubscribeFromTopic(topic);
    print("Unsubscribed from: $topic");
  }

  // Get the device token
  Future<String> getUserToken() async {
    return await _fcm.getToken();
  }

  // The notification displayed when the app is in the foreground
  // Can be customized
  OverlaySupportEntry displayNotif(String body) {
    return showSimpleNotification(
      Text(body),
      background: Colors.green,
    );
  }
}

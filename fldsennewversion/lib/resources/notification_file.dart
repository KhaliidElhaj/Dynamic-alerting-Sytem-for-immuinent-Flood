// import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void notif(String? notifTitle, String? notifBody) async {
  //setting the required prerequisites for the notification stuff
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  //android uses a channel to move the notifications through, its declared below
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'Extreme', 'Extreme Level',
      description: 'This channel is used for the extreme level',
      importance: Importance.max);

  //how the notification pops up
  flutterLocalNotificationsPlugin.show(
      0,
      notifTitle,
      notifBody,
      NotificationDetails(
          android: AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: channel.description,
              enableVibration: false)));
}

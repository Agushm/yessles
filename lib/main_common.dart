import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_widget.dart';
import 'config_reader.dart';
import 'core/services/services.dart';

Future<void> mainCommon(String env) async {
  await initializeDateFormatting();
  var _fcm = FCMService.instance;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await ConfigReader.initialize(env);
  FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(
      _fcm.firebaseMessagingBackgroundHandler);

  if (!kIsWeb) {
    _fcm.channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    _fcm.flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await _fcm.flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_fcm.channel!);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
  runApp(MyApp());
}

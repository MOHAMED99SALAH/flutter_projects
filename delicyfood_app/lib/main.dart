import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:delicyfood/presentation/screens/all_pages/getstart.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:overlay_support/overlay_support.dart';
import 'business/bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  showNotification();
}

Future<void> initNotifications() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@drawable/foodstore'));
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> showNotification() async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
          '1', // channel id
          'DelicyFood', // channel name
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker',
          largeIcon: DrawableResourceAndroidBitmap('@drawable/foodstore'));
  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin.show(
    0, // notification id
    'DelicyFood', // notification title
    'The order has been completed and on its way to you', // notification body
    platformChannelSpecifics,
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initNotifications();
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      showNotification();
    }
  });
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    showNotification();
  });
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => CartBloc()),
      ],
      dependencies: [],
      child: OverlaySupport.global(
        child: MaterialApp(
          title: 'food',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(

              //       primarySwatch: Colors.lightBlue,
              ),
          home: Getstart(),
        ),
      ),
    );
  }
}

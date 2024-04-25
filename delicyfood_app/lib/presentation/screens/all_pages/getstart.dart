import 'dart:io';
import 'package:delicyfood/presentation/screens/all_pages/hasNo_Internet.dart';
import 'package:delicyfood/presentation/screens/all_pages/home.dart';
import 'package:delicyfood/presentation/screens/all_pages/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getstart extends StatefulWidget {
  static String? Name = "";
  static String? name_user = "";
  static String? number = "";
  static String? password = "";
  static bool? state = false;
  static String? User_id = "";

  @override
  _GetstartState createState() => _GetstartState();
}

class _GetstartState extends State<Getstart> {
  void requestNotificatoin() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user agree ");
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage messaging) {
      print('title' +
          "${messaging.notification!.title}" +
          'body' +
          "${messaging.notification!.body}");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestNotificatoin();
    _loadData();
  }

  _loadData() async {
    SharedPreferences? shared_data = await SharedPreferences.getInstance();
    setState(() {
      if (shared_data.getString("NAME") != "" ||
          shared_data.getString("NUMBER") != "" ||
          shared_data.getString("PASS") != "" ||
          shared_data.getString("USERID") != "" ||
          shared_data.getBool("STATE") == false) {
        Getstart.Name = shared_data.getString("NAME");
        Getstart.name_user = shared_data.getString("USERNAME");
        Getstart.password = shared_data.getString("PASS");
        Getstart.number = shared_data.getString("NUMBER");
        Getstart.state = shared_data.getBool("STATE");
        Getstart.User_id = shared_data.getString("USERID");
      } else {
        Getstart.Name = "";
        Getstart.name_user = "";
        Getstart.password = "";
        Getstart.number = "";
        Getstart.state = false;
        Getstart.User_id = "";
      }
    });
  }

  DateTime _dateTime = DateTime.now();

  Widget page() {
    return WillPopScope(
      onWillPop: () async {
        bool value = true;
        if (value == true) {
          SystemNavigator.pop();
        }
        return value;
      },
      child: Scaffold(
        backgroundColor: Colors.teal[600],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Material(
                elevation: 13,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(170),
                    bottomLeft: Radius.circular(170)),
                child: Container(
                  height: MediaQuery.of(context).size.height / 4 +
                      MediaQuery.of(context).size.height / 4 +
                      MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(170),
                        bottomLeft: Radius.circular(170)),
                  ),
                  child: Center(
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width - 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("images/ds.png"),
                      )),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: MaterialButton(
                    elevation: 13,
                    minWidth: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal),
                    ),
                    onPressed: () async {
                      try {
                        //        _saveData("", "", "","", false);

                        if (Getstart.state == false) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Login();
                          }));
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
                        }
                      } on SocketException catch (_) {
                        showSimpleNotification(
                            Text(
                              "No Internet",
                              style: TextStyle(color: Colors.white),
                            ),
                            background: Colors.red);
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return page();
        } else {
          return NoInternet();
        }
      },
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.teal[700],
      )),
    );
  }
}

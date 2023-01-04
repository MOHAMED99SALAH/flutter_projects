import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:kids/presentation/screens/hasNo_Internet.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sizer/sizer.dart';

import '../widgets/bottomPart.dart';

class Getstart extends StatefulWidget {
  static String Name = "";
  static String name_user = "";

  static String phone = "";
  static bool state = false;
  static bool help = false;

  @override
  _GetstartState createState() => _GetstartState();
}

class _GetstartState extends State<Getstart> with TickerProviderStateMixin {
  bool hasinternet;

  ConnectivityResult result = ConnectivityResult.none;

  StreamSubscription _subscription;

  StreamSubscription _subscriptionno;

  AnimationController _coffeeController;
  bool copAnimated = false;
  bool animateCafeText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.9999) {
        _coffeeController.stop();
        copAnimated = true;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          animateCafeText = true;
          setState(() {});
        });
      }
    });

    _loadData();

    _subscription = Connectivity().onConnectivityChanged.listen((event) {
      setState(() {
        result = event;
      });
    });

    _subscriptionno =
        InternetConnectionChecker().onStatusChange.listen((event) {
      final net = event == InternetConnectionStatus.connected;
      setState(() {
        hasinternet = net;
      });
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _subscriptionno.cancel();
    _coffeeController.dispose();
    super.dispose();
  }

  _loadData() async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    setState(() {
      if (shared_data.getString("NAME") != "" ||
          shared_data.getString("USERNAME") != "" ||
          shared_data.getString("PHONE") != "" ||
          shared_data.getBool("STATE") == false) {
        Getstart.Name = shared_data.getString("NAME");
        Getstart.name_user = shared_data.getString("USERNAME");
        Getstart.phone = shared_data.getString("PHONE");
        Getstart.state = shared_data.getBool("STATE");
      } else {
        Getstart.Name = "";
        Getstart.name_user = "";
        Getstart.phone = "";
        Getstart.state = false;
      }
    });
  }

  Widget page() {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
      },
      child: Scaffold(
        backgroundColor: Colors.amberAccent[700],
        body: SingleChildScrollView(
          child: Column(
            children: [
              // White Container top half
              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: copAnimated ? 50.h : 100.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(copAnimated ? 10.w : 0.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Visibility(
                      visible: !copAnimated,
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            color: Colors.white,
                            width: 60.w,
                            height: 30.h,
                            child: Image.asset("images/Kids-Vector-Logo.png"),
                          ),
                          Lottie.asset(
                            'images/lf20_dq66flxb (1).json',
                            height: 22.h,
                            width: 100.w,
                            controller: _coffeeController,
                            fit: BoxFit.cover,
                            onLoaded: (composition) {
                              _coffeeController
                                ..duration = composition.duration
                                ..forward();
                            },
                          ),
                        ],
                      )),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Visibility(
                      visible: copAnimated,
                      child: Lottie.asset(
                        'assets/learn.json',
                        width: 50.w,
                        height: 30.h,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 4.h,
              ),
              // Text bottom part
              Visibility(visible: copAnimated, child: BottomPart()),
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

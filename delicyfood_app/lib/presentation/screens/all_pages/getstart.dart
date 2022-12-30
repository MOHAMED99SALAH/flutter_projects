import 'dart:io';
import 'package:delicyfood/presentation/screens/all_pages/hasNo_Internet.dart';
import 'package:delicyfood/presentation/screens/all_pages/home.dart';
import 'package:delicyfood/presentation/screens/all_pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class getstart extends StatefulWidget {
  static String Name = "";
  static String name_user = "";
  static String number = "";
  static String password = "";
  static bool state = false;

  @override
  _getstartState createState() => _getstartState();
}

class _getstartState extends State<getstart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadData();
  }

  _saveData(String name, String username, String Pass, String number,
      bool state) async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    shared_data.setString("NAME", name);
    shared_data.setString("USERNAME", username);
    shared_data.setString("PASS", Pass);
    shared_data.setString("NUMBER", number);
    shared_data.setBool("STATE", state);
  }

  _loadData() async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    setState(() {
      if (shared_data.getString("NAME") != "" ||
          shared_data.getString("NUMBER") != "" ||
          shared_data.getString("PASS") != "" ||
          shared_data.getBool("STATE") == false) {
        getstart.Name = shared_data.getString("NAME");
        getstart.name_user = shared_data.getString("USERNAME");
        getstart.password = shared_data.getString("PASS");
        getstart.number = shared_data.getString("NUMBER");
        getstart.state = shared_data.getBool("STATE");
      } else {
        getstart.Name = "";
        getstart.name_user = "";
        getstart.password = "";
        getstart.number = "";
        getstart.state = false;
      }
    });
  }

  DateTime _dateTime = DateTime.now();

  Widget page() {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
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

                        if (getstart.state == false) {
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
          return noInternet();
        }
      },
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.teal[700],
      )),
    );
  }
}

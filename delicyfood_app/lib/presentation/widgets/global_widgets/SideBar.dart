import 'package:delicyfood/presentation/screens/all_pages/LastOrder.dart';
import 'package:delicyfood/presentation/screens/all_pages/home.dart';
import 'package:delicyfood/presentation/screens/all_pages/login.dart';
import 'NavigationModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'collapsList.dart';

class sidebar extends StatefulWidget {
  const sidebar({Key key}) : super(key: key);

  @override
  _sidebarState createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {
  double maxwidth = 230;
  double miniwidth = 60;
  final _auth = FirebaseAuth.instance;

  _saveData(bool state) async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();

    shared_data.setBool("STATE", state);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                CollapsList(
                    title: navigationitems[0].title,
                    icon: navigationitems[0].icon,
                    Callback: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
                    }),
                CollapsList(
                    title: navigationitems[1].title,
                    icon: navigationitems[1].icon,
                    Callback: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LastOrder();
                      }));
                    }),
                CollapsList(
                    title: navigationitems[2].title,
                    icon: navigationitems[2].icon,
                    Callback: () {}),
                CollapsList(
                    title: navigationitems[3].title,
                    icon: navigationitems[3].icon,
                    Callback: () {}),
                CollapsList(
                    title: navigationitems[4].title,
                    icon: navigationitems[4].icon,
                    Callback: () {}),
                CollapsList(
                    title: navigationitems[5].title,
                    icon: navigationitems[5].icon,
                    Callback: () {
                      _auth.signOut();
                      _saveData(false);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    }),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

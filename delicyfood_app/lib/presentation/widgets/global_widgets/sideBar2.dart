import 'package:delicyfood/presentation/screens/all_pages/Details_Order.dart';
import 'package:delicyfood/presentation/screens/all_pages/home.dart';
import 'package:delicyfood/presentation/screens/all_pages/login.dart';
import '../../screens/all_pages/lastOrders.dart';
import 'NavigationModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'collapsList.dart';

class Sidebar2 extends StatefulWidget {
  @override
  _Sidebar2State createState() => _Sidebar2State();
}

class _Sidebar2State extends State<Sidebar2> {
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

import '../../../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';

class navigationmodel {
  String title;
  IconData icon;

  navigationmodel({this.title, this.icon});
}

List<navigationmodel> navigationitems = [
  navigationmodel(
    title: "Home Page",
    icon: Icons.home,
  ),
  navigationmodel(title: "Last Order", icon: Icons.insert_comment_sharp),
  navigationmodel(
      title: "Notification", icon: Icons.notifications_active_outlined),
  navigationmodel(title: "Help", icon: Icons.help_outline),
  navigationmodel(title: "Settings", icon: Icons.settings),
  navigationmodel(title: "Log Out", icon: Icons.logout),
];

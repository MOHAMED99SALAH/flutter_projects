import '../../../main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';

class Navigationmodel {
  String title;
  IconData icon;

  Navigationmodel({this.title, this.icon});
}

List<Navigationmodel> navigationitems = [
  Navigationmodel(
    title: "Home Page",
    icon: Icons.home,
  ),
  Navigationmodel(title: "Last Order", icon: Icons.insert_comment_sharp),
  Navigationmodel(
      title: "Notification", icon: Icons.notifications_active_outlined),
  Navigationmodel(title: "Help", icon: Icons.help_outline),
  Navigationmodel(title: "Settings", icon: Icons.settings),
  Navigationmodel(title: "Log Out", icon: Icons.logout),
];

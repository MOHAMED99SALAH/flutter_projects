import 'package:flutter/material.dart';

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
  Navigationmodel(title: "Help", icon: Icons.help_outline),
  Navigationmodel(title: "Log Out", icon: Icons.logout),
];

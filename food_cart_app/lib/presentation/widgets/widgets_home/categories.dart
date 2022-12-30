import 'package:flutter/material.dart';
import 'categoryListItem.dart';

class categores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 185,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryListItem(
            catogoryIcon: Icons.bug_report,
            catogoryName: " Pizza",
            avalability: 12,
            selected: true,
          ),
          CategoryListItem(
            catogoryIcon: Icons.bug_report,
            catogoryName: " Burgers",
            avalability: 10,
            selected: true,
          ),
          CategoryListItem(
            catogoryIcon: Icons.bug_report,
            catogoryName: " Rolls",
            avalability: 15,
            selected: true,
          ),
          CategoryListItem(
            catogoryIcon: Icons.bug_report,
            catogoryName: " fish",
            avalability: 12,
            selected: true,
          ),
          CategoryListItem(
            catogoryIcon: Icons.bug_report,
            catogoryName: " beans",
            avalability: 12,
            selected: true,
          ),
          CategoryListItem(
            catogoryIcon: Icons.bug_report,
            catogoryName: " pepsi",
            avalability: 12,
            selected: true,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'categories.dart';
import 'customAppBar.dart';

class firsthave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: EdgeInsets.fromLTRB(25, 35, 0, 0),
      child: Column(
        children: <Widget>[
          CustomAppbar(),
          SizedBox(
            height: 30,
          ),
          title(),
          SizedBox(
            height: 30,
          ),
          searchBar(),
          SizedBox(
            height: 30,
          ),
          categores(),
        ],
      ),
    );
  }
}

class searchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Icon(Icons.search),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: TextField(
          decoration: InputDecoration(
              helperText: " Search......",
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              hintStyle: TextStyle(
                color: Colors.black87,
              )),
        ))
      ],
    );
  }
}

class title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Food',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
        ),
        Text(
          'Cart',
          style: TextStyle(fontWeight: FontWeight.w200, fontSize: 30),
        )
      ],
    );
  }
}

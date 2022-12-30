import 'package:flutter/material.dart';

class notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.teal[100],
      ),
      height: 90,
      width: ReallyWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("     delicyfood",
                  style: TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              Icon(Icons.all_inclusive_rounded),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 22,
                ),
                Icon(
                  Icons.notifications_active_sharp,
                  size: 23,
                ),
                SizedBox(
                  width: 13,
                ),
                Text("For Short Time ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.brown)),
                SizedBox(
                  width: 75,
                ),
                Row(
                  children: <Widget>[
                    Text("Free",
                        style: TextStyle(
                            fontSize: 19,
                            color: Colors.teal,
                            fontWeight: FontWeight.w600)),
                    Icon(Icons.delivery_dining),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

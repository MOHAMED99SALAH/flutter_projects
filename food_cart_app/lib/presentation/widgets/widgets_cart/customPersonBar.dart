import 'package:flutter/material.dart';

class Custompersonwidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Custompersonwidget();
  }
}

class _Custompersonwidget extends State<Custompersonwidget> {
  double no_of_persons = 1;
  final double buttom_width = 30;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 25),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500], width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(vertical: 5),
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: buttom_width,
            height: buttom_width,
            child: MaterialButton(
              child: Text(
                "-",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                setState(() {
                  no_of_persons--;
                });
              },
            ),
          ),
          Text(
            no_of_persons.toString(),
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
          ),
          SizedBox(
            width: buttom_width,
            height: buttom_width,
            child: MaterialButton(
              child: Text(
                "+",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              onPressed: () {
                setState(() {
                  no_of_persons++;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

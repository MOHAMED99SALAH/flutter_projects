import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  final IconData catogoryIcon;
  final String catogoryName;
  final int avalability;
  final bool selected;

  CategoryListItem(
      {this.catogoryIcon, this.catogoryName, this.avalability, this.selected});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: selected ? Colors.white : Color(0xfffeb324),
        border: Border.all(
          color: selected ? Colors.transparent : Colors.grey[200],
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[100],
              blurRadius: 15,
              offset: Offset(25, 0),
              spreadRadius: 5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                border: Border.all(
                  color: selected ? Colors.transparent : Colors.grey,
                  width: 1.5,
                )),
            child: Icon(
              catogoryIcon,
              color: Colors.black,
              size: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            catogoryName,
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            width: 1.5,
            height: 15,
            color: Colors.black26,
          ),
          Text(
            avalability.toString(),
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
          )
        ],
      ),
    );
  }
}

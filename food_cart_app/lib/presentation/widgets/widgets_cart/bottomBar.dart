import 'package:flutter/material.dart';
import '../../../data/modules/foodItem.dart';
import 'customPersonBar.dart';

class BottomBar extends StatelessWidget {
  final List<FoodItem> fooditems;

  BottomBar({this.fooditems});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalamount(fooditems),
          Divider(
            height: 1,
            color: Colors.grey[700],
          ),
          person(),
          nextAppbar(),
        ],
      ),
    );
  }

  GestureDetector nextAppbar() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(right: 25),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Color(0xfffeb324),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "15-25 min",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              "Next",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }

  Container person() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            " Persons",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          Custompersonwidget(),
        ],
      ),
    );
  }

  Container totalamount(List<FoodItem> foodItem) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total ",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          Text(
            "\$${returntatal(fooditems)}",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  String returntatal(List<FoodItem> fooditems) {
    double totalprice = 0;
    for (int i = 0; i < fooditems.length; i++) {
      totalprice = totalprice + (fooditems[i].price * fooditems[i].quantity);
    }
    return totalprice.toStringAsFixed(2);
  }
}

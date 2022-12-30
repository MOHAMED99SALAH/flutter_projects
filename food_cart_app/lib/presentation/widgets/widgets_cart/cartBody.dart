import 'package:flutter/material.dart';
import '../../../data/modules/foodItem.dart';
import 'cartListItem.dart';
import 'customAddBar.dart';

class Cartbody extends StatelessWidget {
  final List<FoodItem> fooditem;

  Cartbody({this.fooditem});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAddBar(),
          Title(),
          Expanded(
            flex: 1,
            child: fooditem.length > 0 ? fooditemlist() : nofooditemlist(),
          )
        ],
      ),
    );
  }

  Container nofooditemlist() {
    return Container(
      child: Center(
        child: Text(" No Items IN The Cart ",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.grey[500])),
      ),
    );
  }

  ListView fooditemlist() {
    return ListView.builder(
        itemCount: fooditem.length,
        itemBuilder: (builder, index) {
          return Cartlistitem(foodItem: fooditem[index]);
        });
  }

  Widget Title() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35),
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              Text("Order",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w300)),
            ],
          ),
        ],
      ),
    );
  }
}

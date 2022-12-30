import 'package:flutter/material.dart';
import '../../data/data_source/data.dart';
import '../widgets/widgets_home/firstHave.dart';
import '../widgets/widgets_home/itemContainer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              firsthave(),
              SizedBox(
                height: 15,
              ),
              for (var fooditem in foodItemList.foodItems)
                ItemContainer(fooditem)
            ],
          ),
        ),
      ),
    );
  }
}

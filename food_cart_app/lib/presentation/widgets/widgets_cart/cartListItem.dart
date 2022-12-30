import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../data/modules/foodItem.dart';
import 'dragablechiled.dart';

class Cartlistitem extends StatelessWidget {
  final FoodItem foodItem;

  Cartlistitem({this.foodItem});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Draggable(
      data: foodItem,
      maxSimultaneousDrags: 1,
      child: Dragablechiled(foodItem: foodItem),
      feedback: Dragablechiledfeedback(
        foodItem: foodItem,
      ),
      childWhenDragging: foodItem.quantity > 1
          ? Dragablechiled(foodItem: foodItem)
          : Container(),
    );
  }
}

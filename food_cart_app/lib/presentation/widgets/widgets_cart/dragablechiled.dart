import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import '../../../business/bloc/blocstyle.dart';
import '../../../data/modules/foodItem.dart';
import 'itemContent.dart';

class Dragablechiled extends StatelessWidget {
  const Dragablechiled({Key key, this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: itemContent(foodItem: foodItem),
    );
  }
}

class Dragablechiledfeedback extends StatelessWidget {
  const Dragablechiledfeedback({Key key, this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();
    // TODO: implement build
    return Material(
      child: Opacity(
          opacity: .7,
          child: Material(
              child: StreamBuilder(
                  stream: colorBloc.colorstream,
                  builder: (context, snapshop) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: itemContent(foodItem: foodItem),
                      decoration: BoxDecoration(
                        color: snapshop.data != null
                            ? snapshop.data
                            : Colors.white,
                      ),
                    );
                  }))),
    );
  }
}

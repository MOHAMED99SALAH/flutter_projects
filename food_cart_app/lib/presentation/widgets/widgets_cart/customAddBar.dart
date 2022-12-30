import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../business/bloc/blocstyle.dart';
import '../../../data/modules/foodItem.dart';
import '../../../business/bloc/foodlistbloc.dart';

class CustomAddBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
          ),
        ),
        Dragitemwidget(),
      ],
    );
  }
}

class Dragitemwidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Dragitemwidget();
  }
}

class _Dragitemwidget extends State<Dragitemwidget> {
  final CartListBloc bloclist = BlocProvider.getBloc<CartListBloc>();
  final ColorBloc colorBloc = BlocProvider.getBloc<ColorBloc>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DragTarget<FoodItem>(onWillAccept: (FoodItem foodItem) {
      colorBloc.Setcolor(Colors.red);
      return true;
    }, onAccept: (FoodItem foodItem) {
      bloclist.removefromlist(foodItem);
      colorBloc.Setcolor(Colors.white);
    }, builder: (context, incoming, rejected) {
      return GestureDetector(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            CupertinoIcons.delete,
            size: 35,
          ),
        ),
        onTap: () {},
      );
    });
  }
}

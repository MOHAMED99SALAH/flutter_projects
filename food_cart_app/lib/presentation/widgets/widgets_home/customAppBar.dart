import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import '../../../business/bloc/foodlistbloc.dart';
import '../../../data/modules/foodItem.dart';

import '../../screens/cart.dart';

class CustomAppbar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.menu),
          StreamBuilder(
            stream: bloc.ListStream,
            builder: (context, snapshot) {
              List<FoodItem> fooditems = snapshot.data;
              int length = fooditems != null ? fooditems.length : 0;
              return buildGestureDetector(length, context, fooditems);
            },
          ),
        ],
      ),
    );
  }
}

GestureDetector buildGestureDetector(
    int length, BuildContext context, List<FoodItem> fooditems) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
    },
    child: Container(
      margin: EdgeInsets.only(right: 30),
      child: Text(length.toString()),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.yellow[800],
      ),
    ),
  );
}

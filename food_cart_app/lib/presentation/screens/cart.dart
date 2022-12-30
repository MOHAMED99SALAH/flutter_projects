import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import '../../data/modules/foodItem.dart';
import '../../business/bloc/foodlistbloc.dart';
import '../widgets/widgets_cart/bottomBar.dart';
import '../widgets/widgets_cart/cartBody.dart';

class Cart extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<FoodItem> fooditems;
    // TODO: implement build
    return StreamBuilder(
      stream: bloc.ListStream,
      builder: (context, snapshop) {
        if (snapshop.data != null) {
          fooditems = snapshop.data;
          return Scaffold(
            body: SafeArea(
              child: Container(
                child: Cartbody(fooditem: fooditems),
              ),
            ),
            bottomNavigationBar: BottomBar(fooditems: fooditems),
          );
        } else
          return Container();
      },
    );
  }
}

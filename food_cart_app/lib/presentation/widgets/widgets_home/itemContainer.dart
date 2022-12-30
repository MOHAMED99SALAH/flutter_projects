import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import '../../../business/bloc/foodlistbloc.dart';
import '../../../data/modules/foodItem.dart';
import 'item.dart';

class ItemContainer extends StatelessWidget {
  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
  addtocart(FoodItem fooditem) {
    bloc.addtolist(fooditem);
  }

  ItemContainer(this.foodItem);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        addtocart(foodItem);

        final snackbar = SnackBar(
          content: Text("${foodItem.title} added to the Cart"),
          duration: Duration(milliseconds: 550),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
      child: Item(
        hotel: foodItem.hotel,
        itemName: foodItem.title,
        itemPrice: foodItem.price,
        imgUrl: foodItem.imgUrl,
        leftalign: (foodItem.id % 2 == 0) ? true : false,
      ),
    );
  }
}

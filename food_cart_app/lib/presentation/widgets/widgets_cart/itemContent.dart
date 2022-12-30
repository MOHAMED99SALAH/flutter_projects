import 'package:flutter/material.dart';
import '../../../data/modules/foodItem.dart';

class itemContent extends StatelessWidget {
  final FoodItem foodItem;

  itemContent({this.foodItem});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              foodItem.imgUrl,
              fit: BoxFit.fitHeight,
              height: 55,
              width: 80,
            ),
          ),
          RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: foodItem.quantity.toString(),
                  ),
                  TextSpan(
                    text: "X",
                  ),
                  TextSpan(text: foodItem.title),
                ]),
          ),
          Text(
            "\$${foodItem.quantity * foodItem.price}",
            style:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[300]),
          )
        ],
      ),
    );
  }
}

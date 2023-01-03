import 'package:delicyfood/presentation/screens/all_pages/Cart.dart';
import 'package:flutter/material.dart';

class ButtomOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Center(
      child: Container(
        height: 60,
        width: ReallyWidth,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Cart();
            }));
          },
          color: Colors.teal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                " Orders",
                style: TextStyle(fontSize: 21, color: Colors.white),
              ),
              Icon(Icons.shopping_cart_outlined),
            ],
          ),
        ),
      ),
    );
  }
}

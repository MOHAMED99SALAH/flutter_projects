import 'package:cached_network_image/cached_network_image.dart';
import 'package:delicyfood/data/models/soldProduct.dart';
import 'package:flutter/material.dart';
import '../../../data/models/Order.dart';
import '../../screens/all_pages/Details_Order.dart';
import 'driver_orderDetails.dart';

class driver_Order_shape extends StatefulWidget {
  Order _order;

  static Color? color = Colors.white;

  driver_Order_shape(this._order);

  @override
  State<driver_Order_shape> createState() => _driver_Order_shapeState();
}

class _driver_Order_shapeState extends State<driver_Order_shape> {
  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return driver_OrderDetails(widget._order);
        }));
      },
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          height: 90,
          width: ReallyWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(widget._order.date!,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(" Total Price-->   ${widget._order.totalPrice}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87)),
                ],
              ),
              SizedBox(
                width: 52,
              ),
              Image.asset(
                "images/order.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}

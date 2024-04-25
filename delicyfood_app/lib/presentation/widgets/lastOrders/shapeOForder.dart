import 'package:cached_network_image/cached_network_image.dart';
import 'package:delicyfood/data/models/soldProduct.dart';
import 'package:flutter/material.dart';

import '../../../data/models/Order.dart';
import '../../screens/all_pages/Details_Order.dart';

class shapeOForder extends StatelessWidget {
  Order _order;

  shapeOForder(this._order);

  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Details_Order(_order.orderDetails);
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
                  Text(_order.date!,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(" Total Price-->   ${_order.totalPrice}",
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

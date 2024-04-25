import 'package:delicyfood/data/data_source/Data_Api.dart';
import 'package:delicyfood/data/models/soldProduct.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/widgets/lastOrders/LastOrderShape.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../data/models/order_details.dart';

class Details_Order extends StatefulWidget {
  List<OrderDetail>? items;

  Details_Order(this.items);

  @override
  State<Details_Order> createState() => _Details_OrderState();
}

class _Details_OrderState extends State<Details_Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text(
              "Order ",
              style: TextStyle(color: Colors.teal[700]),
            ),
            leading: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.teal[700],
                  size: 25,
                )),
            backgroundColor: Colors.white,
            centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              for (OrderDetail item in widget!.items!)
                LastOrderShape(item.product, item.quantity)
            ],
          ),
        ));
  }
}

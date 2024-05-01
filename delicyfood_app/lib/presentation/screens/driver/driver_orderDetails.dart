import 'package:delicyfood/data/data_source/Data_Api.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/widgets/lastOrders/LastOrderShape.dart';
import 'package:delicyfood/presentation/widgets/market/order_Shape.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../data/models/Order.dart';
import '../../../data/models/location.dart';
import '../../../data/models/order_details.dart';
import '../market/orders.dart';
import 'dart:convert';

import 'driver_orders.dart';

class driver_OrderDetails extends StatefulWidget {
  Order _order;

  driver_OrderDetails(this._order);

  String? address;

  @override
  State<driver_OrderDetails> createState() => _driver_OrderDetailsState();
}

class _driver_OrderDetailsState extends State<driver_OrderDetails> {
  Data_api? _data_api;
  Products_repository? repo;

  String? email;

  String decodeArabicText(String encodedText) {
    // Convert the encoded text to bytes
    List<int> bytes = encodedText.codeUnits;

    // Decode the bytes using UTF-8 encoding
    String decodedText = utf8.decode(bytes);

    return decodedText;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data_api = new Data_api();
    repo = new Products_repository(_data_api!);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    email = user!.email;
    widget.address = decodeArabicText(widget._order.locationOforder.address);
    print(widget._order.phone);
  }

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
              for (OrderDetail item in widget!._order.orderDetails!)
                LastOrderShape(item.product, item.quantity),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                initialValue: widget.address,
                minLines: 1,
                maxLines: 10,
                enabled: false,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: "Your address",
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                initialValue: widget._order.phone,
                minLines: 1,
                maxLines: 10,
                enabled: false,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    prefixIcon: Icon(
                      Icons.phone,
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 3 + 55,
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width / 2,
                  height: 50,
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "finish",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "DelicyFood",
                              style: TextStyle(color: Colors.red),
                            ),
                            content:
                                Text("Are you sure to finish the the order ?"),
                            actions: [
                              MaterialButton(
                                child: Text(
                                  "Yes",
                                ),
                                onPressed: () async {
                                  bool status = await repo!
                                      .updateDriverStatus(email, false);

                                  if (status == true) {
                                    bool check = await repo!
                                        .updateDriverStatusOforder(
                                            widget._order.orderID);

                                    if (check == true) {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return driver_Orders();
                                      }));
                                      SnackBar snackBar = SnackBar(
                                        content: Text(
                                            "order was completed successfully",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        backgroundColor: Colors.blueGrey,
                                        duration: Duration(milliseconds: 1500),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      setState(() {
                                        Order_shape.color = Colors.red;
                                      });
                                    } else {
                                      SnackBar snackBar = SnackBar(
                                        content: Text(
                                          "some thing went wrong",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        backgroundColor:
                                            Color.fromARGB(255, 177, 44, 44),
                                        duration: Duration(milliseconds: 1200),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  } else {
                                    SnackBar snackBar = SnackBar(
                                      content: Text(
                                        "some thing went wrong",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 177, 44, 44),
                                      duration: Duration(milliseconds: 1200),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                },
                              ),
                              MaterialButton(
                                child: Text(
                                  "No",
                                ),
                                onPressed: () async {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:delicyfood/data/data_source/Data_Api.dart';
import 'package:delicyfood/data/models/soldProduct.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/screens/all_pages/getstart.dart';
import 'package:delicyfood/presentation/widgets/lastOrders/LastOrderShape.dart';
import 'package:delicyfood/presentation/widgets/shop/order_Shape.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../data/models/order_details.dart';
import '../driver/drivers.dart';
import 'orders.dart';

class OrderDetails extends StatefulWidget {
  List<OrderDetail>? items;

  int id;

  OrderDetails(this.items, this.id);

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Data_api? _data_api;
  Products_repository? repo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data_api = new Data_api();
    repo = new Products_repository(_data_api!);
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
              for (OrderDetail item in widget!.items!)
                LastOrderShape(item.product, item.quantity),
              SizedBox(
                height: 100,
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
                    "choose driver",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return drivers(widget.id);
                    }));
                  },
                ),
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
                                  bool status =
                                      await repo!.updateMarketStatus(widget.id);
                                  if (status == true) {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Orders();
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

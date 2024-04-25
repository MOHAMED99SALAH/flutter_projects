import 'package:delicyfood/data/data_source/Data_Api.dart';
import 'package:delicyfood/data/models/Order.dart';
import 'package:delicyfood/data/models/soldProduct.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../widgets/lastOrders/shapeOForder.dart';

class Last_Orders extends StatefulWidget {
  @override
  State<Last_Orders> createState() => _Last_OrdersState();
}

class _Last_OrdersState extends State<Last_Orders> {
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
              "Orders ",
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
              FutureBuilder(
                  future: repo!.getLastOrders(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Center(
                              child: LoadingAnimationWidget.inkDrop(
                            color: Colors.teal[700]!,
                            size: 45,
                          )),
                        ],
                      );
                    }
                    if (snapshot.data.length != 0) {
                      return ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return shapeOForder(snapshot.data[index]);
                          });
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Lottie.asset("images/no -data .json",
                                  fit: BoxFit.fill),
                              height: 450,
                              width: 400,
                            ),
                          ),
                        ],
                      );
                    }
                  }),
            ],
          ),
        ));
  }
}

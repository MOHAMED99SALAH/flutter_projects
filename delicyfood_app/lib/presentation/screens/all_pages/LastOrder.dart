import 'package:delicyfood/data/data_source/Data_Api.dart';
import 'package:delicyfood/data/models/soldProduct.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/widgets/lastOrders/LastOrderShape.dart';
import 'package:flutter/material.dart';

class LastOrder extends StatefulWidget {
  @override
  State<LastOrder> createState() => _LastOrderState();
}

class _LastOrderState extends State<LastOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text(
              "Last Order ",
              style: TextStyle(color: Colors.teal[700]),
            ),
            backgroundColor: Colors.white,
            centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              FutureBuilder(
                  future: Products_repository(Data_api()).getLastOrder(),
                  builder: (context, snapshot) {
                    List<SoldProduct> products = snapshot.data;

                    return SizedBox(
                      height: 150,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(2),
                        itemCount: products.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 3,
                          );
                        },
                        itemBuilder: (context, index) {
                          return LastOrderShape(products[index]);
                        },
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}

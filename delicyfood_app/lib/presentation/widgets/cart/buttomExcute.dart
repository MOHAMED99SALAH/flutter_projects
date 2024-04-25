import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicyfood/data/models/location.dart';
import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/screens/all_pages/address.dart';
import 'package:delicyfood/business/bloc/centralProvider.dart';
import 'package:delicyfood/presentation/screens/all_pages/getstart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/data_source/Data_Api.dart';

class ButtomExcute extends StatefulWidget {
  List<Product> soldProducts;

  ButtomExcute(this.soldProducts);

  @override
  State<ButtomExcute> createState() => _ButtomExcuteState();
}

class _ButtomExcuteState extends State<ButtomExcute> {
  Data_api? _data_api;
  Products_repository? repo;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String collectionName = "Users";
  String? email;
  String? phone = "";
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('Users');

  void getUsersData() {
    collectionReference.where('email', isEqualTo: email).get().then((value) {
      setState(() {
        phone = value.docs[0]['Phone'];
      });
    });
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
    getUsersData();
  }

  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    var cost = Provider.of<TotalPrice>(context, listen: false);
    // TODO: implement build
    return Center(
      child: Container(
        height: 60,
        width: ReallyWidth - 100,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          onPressed: () async {
            if (cost.num != 0) {
              if (cost.num > 15) {
                if (Address.address.isEmpty) {
                  SnackBar snackBar = SnackBar(
                    content: Text("Please Write Your Address"),
                    backgroundColor: Colors.blueGrey,
                    duration: Duration(milliseconds: 2000),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "DelicyFood",
                            style: TextStyle(color: Colors.red),
                          ),
                          content: Text("Are you sure to confirm the order ?"),
                          actions: [
                            MaterialButton(
                              child: Text(
                                "Yes",
                              ),
                              onPressed: () async {
                                print(phone!);
                                if (phone == "") {
                                  Navigator.of(context).pop();
                                  SnackBar snackBar = SnackBar(
                                    content: Text(
                                      "some thing went wrong",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    backgroundColor:
                                        Color.fromARGB(255, 177, 44, 44),
                                    duration: Duration(milliseconds: 2500),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  bool status = await repo!.addOrder(
                                      widget.soldProducts,
                                      cost.num.toInt(),
                                      Address?.address!,
                                      phone!);
                                  if (status == true) {
                                    Navigator.of(context).pop();
                                    SnackBar snackBar = SnackBar(
                                      content: Text(
                                        "Your order will arrive in 15 minutes " +
                                            "  TO " +
                                            Getstart.name_user!,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      duration: Duration(milliseconds: 3000),
                                      backgroundColor: Colors.blueGrey,
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    SnackBar snackBar = SnackBar(
                                      content: Text(
                                        "some thing went wrong",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      backgroundColor:
                                          Color.fromARGB(255, 177, 44, 44),
                                      duration: Duration(milliseconds: 2500),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
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
                }
              } else {
                SnackBar snackBar = SnackBar(
                  content: Text("Please reach To Minimum Order Price"),
                  duration: Duration(milliseconds: 2500),
                  backgroundColor: Colors.blueGrey,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            } else {
              SnackBar snackBar = SnackBar(
                content: Text("no items in cart"),
                backgroundColor: Colors.blueGrey,
                duration: Duration(milliseconds: 2000),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          color: Colors.teal,
          child: Text(
            " Buy Now",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

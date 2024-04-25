import 'package:cached_network_image/cached_network_image.dart';
import 'package:delicyfood/data/models/soldProduct.dart';
import 'package:flutter/material.dart';

import '../../../data/data_source/Data_Api.dart';
import '../../../data/models/Order.dart';
import '../../../data/models/driver.dart';
import '../../../data/repository/repository.dart';
import '../../screens/all_pages/Details_Order.dart';
import 'drivers.dart';

class driverShape extends StatefulWidget {
  driver? _driver;

  int order_id;
  driverShape(this._driver, this.order_id);

  @override
  State<driverShape> createState() => _driverShapeState();
}

class _driverShapeState extends State<driverShape> {
  Data_api? _data_api;
  Products_repository? repo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data_api = Data_api();
    repo = Products_repository(_data_api!);
  }

  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return GestureDetector(
      onTap: () async {
        return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  "delicyFood",
                  style: TextStyle(color: Colors.red),
                ),
                content: Text("Are you sure to set this driver ?"),
                actions: [
                  MaterialButton(
                    child: Text(
                      "Yes",
                    ),
                    onPressed: () async {
                      bool status = await repo!
                          .updateDriverStatus(widget!._driver!.email!, true);
                      if (status == true) {
                        bool check = await repo!.updateDriverOforder(
                            widget.order_id, widget!._driver!);

                        if (check == true) {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return drivers(widget.order_id);
                          }));
                        } else {
                          SnackBar snackBar = SnackBar(
                            content: Text(
                              "some thing went wrong",
                              style: TextStyle(color: Colors.black),
                            ),
                            backgroundColor: Color.fromARGB(255, 177, 44, 44),
                            duration: Duration(milliseconds: 1200),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        SnackBar snackBar = SnackBar(
                          content: Text(
                            "some thing went wrong",
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor: Color.fromARGB(255, 177, 44, 44),
                          duration: Duration(milliseconds: 1200),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                  Text(widget._driver!.email!,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 8,
                  ),
                  Text(" Phone -->  ${widget._driver!.phone}",
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
                "images/driver.jpg",
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

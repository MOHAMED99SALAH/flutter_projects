import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/widgets/admin/deleteShape.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../data/data_source/Data_Api.dart';

class DeleteProduct extends StatefulWidget {
  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  int? item_id;
  String? Id = "";

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
              "delete Product ",
              style: TextStyle(color: Colors.teal[700]),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.teal[700],
                size: 25,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal[200],
                  ),
                  height: 70,
                  width: double.infinity,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      "Note : Scroll horizontally and Enter ID of item you want to delete.",
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Vegetables",
                style: TextStyle(
                    color: Colors.teal[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: FutureBuilder(
                    future: repo!.getvege(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Column(
                          children: <Widget>[
                            Center(
                                child: LoadingAnimationWidget.inkDrop(
                              color: Colors.teal[700]!,
                              size: 45,
                            ))
                          ],
                        );
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(2),
                          itemCount: snapshot.data.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 2,
                            );
                          },
                          itemBuilder: (context, index) {
                            return DeleteShape(snapshot.data[index]);
                          },
                        );
                      }
                    }),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Fruits",
                style: TextStyle(
                    color: Colors.teal[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: FutureBuilder(
                    future: repo!.getfruits(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Column(
                          children: <Widget>[
                            Center(
                                child: LoadingAnimationWidget.inkDrop(
                              color: Colors.teal[700]!,
                              size: 45,
                            ))
                          ],
                        );
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(2),
                          itemCount: snapshot.data.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 2,
                            );
                          },
                          itemBuilder: (context, index) {
                            return DeleteShape(snapshot.data[index]);
                          },
                        );
                      }
                    }),
              ),
              SizedBox(
                height: 2,
                width: double.infinity,
                child: Container(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 17, right: 17),
                child: TextFormField(
                  onChanged: (value) {
                    Id = value;
                    item_id = int.parse(value.toString());
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Color(0xFFe7edeb),
                      hintText: "Enter Item ID",
                      prefixIcon: Icon(
                        Icons.numbers,
                        color: Colors.grey[800],
                      )),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 50,
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "delete Product",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () async {
                  if (Id!.isEmpty) {
                    SnackBar snackBar = SnackBar(
                      content: Text("Please complete all Fields",
                          style: TextStyle(color: Colors.black)),
                      backgroundColor: Colors.red,
                      duration: Duration(milliseconds: 2000),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Warning",
                              style: TextStyle(color: Colors.red),
                            ),
                            content: Text("Are you sure to delete the item ?"),
                            actions: [
                              MaterialButton(
                                child: Text(
                                  "Yes",
                                ),
                                onPressed: () async {
                                  bool status =
                                      await repo!.deleteProduct(item_id!);
                                  if (status == true) {
                                    Navigator.of(context).pop();
                                    SnackBar snackBar = SnackBar(
                                      content: Text("item deleted successfully",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      backgroundColor: Colors.blueGrey,
                                      duration: Duration(milliseconds: 1200),
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
                  }
                },
              ),
            ],
          ),
        ));
  }
}

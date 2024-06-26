import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/screens/admin/updateProduct.dart';
import 'package:flutter/material.dart';

import '../../../data/data_source/Data_Api.dart';
import '../../../data/models/add_product.dart';

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? name;
  double? price;
  double? quantity;
  String? imgPath;
  int? Catg_id;

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController imgPathController = TextEditingController();
  TextEditingController catg_idController = TextEditingController();

  Data_api? _data_api;
  Products_repository? repo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data_api = new Data_api();
    repo = new Products_repository(_data_api!);
  }

  List cat_List = ["Vegetables -> 1", "Fruits -> 2"];

  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: Text(
            "add Product ",
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 17, right: 17),
                  child: TextFormField(
                    controller: nameController,
                    onChanged: (value) {
                      name = value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFe7edeb),
                        hintText: "Product name",
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.grey[800],
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17, right: 17),
                  child: TextFormField(
                    controller: priceController,
                    onChanged: (value) {
                      price = double.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFe7edeb),
                        hintText: "Price",
                        prefixIcon: Icon(
                          Icons.price_change,
                          color: Colors.grey[800],
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17, right: 17),
                  child: TextFormField(
                    controller: quantityController,
                    onChanged: (value) {
                      quantity = double.parse(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFe7edeb),
                        hintText: "Quantity",
                        prefixIcon: Icon(
                          Icons.numbers,
                          color: Colors.grey[800],
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 17, right: 17),
                  child: TextFormField(
                    controller: imgPathController,
                    onChanged: (value) {
                      imgPath = value;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Color(0xFFe7edeb),
                        hintText: " Url of Image",
                        prefixIcon: Icon(
                          Icons.image,
                          color: Colors.grey[800],
                        )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton(
                        hint: Text("Category ID"),
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 36,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(color: Colors.black, fontSize: 22),
                        value: valueChoose,
                        onChanged: (value) {
                          setState(() {
                            if (value == "Vegetables -> 1") {
                              Catg_id = 1;
                            }

                            if (value == "Fruits -> 2") {
                              Catg_id = 2;
                            }

                            valueChoose = value.toString();
                          });
                        },
                        items: cat_List.map((item) {
                          return DropdownMenuItem(
                              value: item, child: Text(item));
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 55,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border(
                  bottom: BorderSide(color: Colors.white38),
                  top: BorderSide(color: Colors.white38),
                  left: BorderSide(color: Colors.white38),
                  right: BorderSide(color: Colors.white38),
                ),
              ),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 50,
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "add Product",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () async {
                  if (nameController.text!.isEmpty ||
                      priceController.text!.isEmpty ||
                      quantityController.text!.isEmpty ||
                      imgPathController.text!.isEmpty ||
                      Catg_id == null) {
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
                            content: Text("Are you sure to add the item ?"),
                            actions: [
                              MaterialButton(
                                child: Text(
                                  "Yes",
                                ),
                                onPressed: () async {
                                  Added_product addedProduct =
                                      new Added_product(
                                          imgPathController.text,
                                          nameController.text,
                                          priceController.text.toString(),
                                          quantityController.text.toString(),
                                          Catg_id.toString());

                                  bool status =
                                      await repo!.addProduct(addedProduct);
                                  if (status == true) {
                                    Navigator.of(context).pop();
                                    SnackBar snackBar = SnackBar(
                                      content: Text("item added successfully",
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
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:flutter/material.dart';

import '../../../data/data_source/Data_Api.dart';

class UpdateProduct extends StatefulWidget {
  Product UpdatedProduct;

  UpdateProduct(this.UpdatedProduct);
  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  Data_api? _data_api;
  Products_repository? repo;

  String? price = "not empty";
  String? quantity = " not empty ";
  String? name = " not empty";
  String? imgPath = " not empty";
  String? Catg_id = " not empty";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data_api = new Data_api();
    repo = new Products_repository(_data_api!);
  }

  List cat_List = ["Vegetables -> 1", "Fruits -> 2"];

  @override
  Widget build(BuildContext context) {
    int? Category_id = widget.UpdatedProduct.catgID;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: Text(
            "update Product ",
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
                    initialValue: widget.UpdatedProduct.name,
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
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
                    initialValue: widget.UpdatedProduct.price.toString(),
                    onChanged: (value) {
                      price = value;
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
                    initialValue: widget.UpdatedProduct.quantity.toString(),
                    onChanged: (value) {
                      quantity = value;
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
                    initialValue: widget.UpdatedProduct.imagePath.toString(),
                    onChanged: (value) {
                      setState(() {
                        imgPath = value;
                      });
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
                        value: Category_id == 1 ? cat_List[0] : cat_List[1],
                        onChanged: (value) {
                          setState(() {
                            if (value == "Vegetables -> 1") {
                              Category_id = 1;
                            }

                            if (value == "Fruits -> 2") {
                              Category_id = 2;
                            }
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
                  "update Product",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () async {
                  if (name!.isEmpty ||
                      price!.isEmpty ||
                      quantity!.isEmpty ||
                      imgPath!.isEmpty ||
                      widget.UpdatedProduct.catgID!.toString().isEmpty) {
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
                            content: Text("Are you sure to update the item ?"),
                            actions: [
                              MaterialButton(
                                child: Text(
                                  "Yes",
                                ),
                                onPressed: () async {
                                  Product Updated_Product = new Product(
                                      widget.UpdatedProduct.id,
                                      imgPath,
                                      name,
                                      double.parse(price.toString()),
                                      double.parse(quantity.toString()),
                                      widget.UpdatedProduct.catgID);
                                  bool status = await repo!
                                      .updateProduct(Updated_Product);
                                  if (status == true) {
                                    Navigator.of(context).pop();
                                    SnackBar snackBar = SnackBar(
                                      content: Text("item updated successfully",
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

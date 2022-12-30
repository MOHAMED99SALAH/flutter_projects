import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/widgets/admin/updateShape.dart';
import 'package:flutter/material.dart';

class chooseUpdateProduct extends StatefulWidget {
  @override
  State<chooseUpdateProduct> createState() => _chooseUpdateProductState();
}

class _chooseUpdateProductState extends State<chooseUpdateProduct> {
  products_repository repo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text(
              "update Product ",
              style: TextStyle(color: Colors.teal[700]),
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
                      "Note : Scroll horizontally and Enter ID of item you want to update.",
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 90,
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
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(2),
                  itemCount: productListItem_fruits.list_categ.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return updateShape(
                        productListItem_vegetables.list_categ[index]);
                  },
                ),
              ),
              SizedBox(
                height: 70,
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
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(2),
                  itemCount: productListItem_fruits.list_categ.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return updateShape(
                        productListItem_fruits.list_categ[index]);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

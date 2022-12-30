import 'package:delicyfood/presentation/screens/admin/addProduct.dart';
import 'package:delicyfood/presentation/screens/admin/deleteProduct.dart';
import 'package:delicyfood/presentation/screens/admin/updateProduct.dart';
import 'package:delicyfood/presentation/screens/admin/updatedchoosenProduct.dart';
import 'package:flutter/material.dart';

class adminPage extends StatefulWidget {
  const adminPage({Key key}) : super(key: key);

  @override
  State<adminPage> createState() => _adminPageState();
}

class _adminPageState extends State<adminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: Text(
            "Admin ",
            style: TextStyle(color: Colors.teal[700]),
          ),
          backgroundColor: Colors.white,
          centerTitle: true),
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              height: 50,
              color: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "add product",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return addProduct();
                    },
                  ),
                );
              }),
          SizedBox(
            height: 50,
          ),
          MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              height: 50,
              color: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "update product",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return chooseUpdateProduct();
                    },
                  ),
                );
              }),
          SizedBox(
            height: 50,
          ),
          MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              height: 50,
              color: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "delete product",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return deleteProduct();
                    },
                  ),
                );
              }),
        ],
      )),
    );
  }
}

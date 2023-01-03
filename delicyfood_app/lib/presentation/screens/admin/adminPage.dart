import 'package:delicyfood/presentation/screens/admin/addProduct.dart';
import 'package:delicyfood/presentation/screens/admin/deleteProduct.dart';
import 'package:delicyfood/presentation/screens/admin/updateProduct.dart';
import 'package:delicyfood/presentation/screens/admin/updatedchoosenProduct.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
                      return AddProduct();
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
                      return ChooseUpdateProduct();
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
                      return DeleteProduct();
                    },
                  ),
                );
              }),
        ],
      )),
    );
  }
}

import 'package:delicyfood/presentation/screens/all_pages/hasNo_Internet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'login.dart';

class Address extends StatefulWidget {
  static String address = "";
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  Widget page() {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text(" Address"),
        backgroundColor: Colors.teal[700],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 150,
          ),
          Center(
              child: Text(
            "Enter your Address",
            style: TextStyle(
                color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 17, right: 17),
            child: TextFormField(
              onChanged: (value) => Address.address = value,
              keyboardType: TextInputType.emailAddress,
              initialValue: Address.address,
              minLines: 1,
              maxLines: 10,
              style: TextStyle(fontSize: 20),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Color(0xFFe7edeb),
                  hintText: "Your address",
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                  )),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              height: 50,
              color: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Confirm ",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              onPressed: () async {
                if (Address.address == null || Address.address == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(" address is Empty "),
                    backgroundColor: Colors.blueGrey,
                  ));
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return page();
        } else {
          return NoInternet();
        }
      },
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.teal[700],
      )),
    );
  }
}

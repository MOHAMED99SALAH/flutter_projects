import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/data_source/Data_Api.dart';
import '../../../data/models/driver.dart';
import '../../../data/repository/repository.dart';
import '../market/orders.dart';

class driver_Register extends StatefulWidget {
  const driver_Register({super.key});

  @override
  State<driver_Register> createState() => _driver_RegisterState();
}

class _driver_RegisterState extends State<driver_Register> {
  final _auth = FirebaseAuth.instance;
  String _email = "";
  String _pass = "";
  String phone = "";

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
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        bool value = true;
        if (value == true) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Orders();
          }));
        }
        return value;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Sign Up as driver ",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Create an free account ",
                    style: TextStyle(fontSize: 15, color: Colors.teal[700]),
                  )
                ],
              ),
              SizedBox(height: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 17, right: 17),
                    child: TextFormField(
                      onChanged: (value) {
                        _email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: "E-mail address",
                          prefixIcon: Icon(
                            Icons.email,
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
                      onChanged: (value) {
                        _pass = value;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
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
                      onChanged: (value) {
                        phone = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: " Phone Number",
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.grey[800],
                          )),
                    ),
                  ),
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
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  onPressed: () async {
                    try {
                      if (_pass == "" && _email == "" && phone == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("All fields required "),
                          backgroundColor: Colors.blueGrey,
                        ));
                      } else if (_email == null || _email == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("E-mail address  is Empty "),
                          backgroundColor: Colors.blueGrey,
                        ));
                      } else if (_pass == null || _pass == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("password  is Empty "),
                          backgroundColor: Colors.blueGrey,
                        ));
                      } else if (phone == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Phone Number is  Empty "),
                          backgroundColor: Colors.blueGrey,
                        ));
                      } else {
                        final user = await _auth.createUserWithEmailAndPassword(
                            email: _email.trim(), password: _pass.trim());

                        if (user != null) {
                          driver _driver =
                              new driver(ID: 0, email: _email, phone: phone);
                          bool status = await repo!.addDriver(_driver);
                          if (status == true) {
                            Navigator.of(context).pop();
                            SnackBar snackBar = SnackBar(
                              content: Text("driver registred successfully",
                                  style: TextStyle(color: Colors.white)),
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
                              backgroundColor: Color.fromARGB(255, 177, 44, 44),
                              duration: Duration(milliseconds: 1200),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        }
                      }
                    } on FirebaseAuthException catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          error.message.toString(),
                        ),
                        backgroundColor: Colors.blueGrey,
                      ));
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
      ),
    );
  }
}

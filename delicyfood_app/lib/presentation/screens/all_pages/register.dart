import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delicyfood/data/models/user.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String _email = "";
  String _pass = "";
  String num = "";
  String name = "";

  _saveData(String name, String username, String Pass, String number,
      bool state) async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    shared_data.setString("NAME", name);
    shared_data.setString("USERNAME", username);
    shared_data.setString("PASS", Pass);
    shared_data.setString("NUMBER", number);
    shared_data.setBool("STATE", state);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
      onWillPop: () async {
        bool value = true;
        if (value == true) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Login();
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
                    "Sign Up",
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
                  Padding(
                    padding: EdgeInsets.only(left: 17, right: 17),
                    child: TextFormField(
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
                          hintText: "UserName",
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
                        num = value;
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
                      if (_pass == "" && _email == "" && num == "") {
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
                      } else if (num == "") {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Phone Number is  Empty "),
                          backgroundColor: Colors.blueGrey,
                        ));
                      } else {
                        final user = await _auth.createUserWithEmailAndPassword(
                            email: _email.trim(), password: _pass.trim());

                        userr _user = new userr(
                            email: _email.trim(),
                            password: _pass.trim(),
                            phone: num.trim());

                        _user.uploadDataUser(context);
                        if (user != null) {
                          _saveData(name, _email, _pass, num, false);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Login();
                              },
                            ),
                          );
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

import 'package:delicyfood/presentation/screens/all_pages/hasNo_Internet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'login.dart';

class data extends StatefulWidget {
  @override
  _dataState createState() => _dataState();
}

class _dataState extends State<data> {
  String _email = "";
  String password = "";

  FirebaseAuth _auth = FirebaseAuth.instance;

  Widget page() {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: Text("Personal Data"),
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
            "Enter your E-mail Address",
            style: TextStyle(
                color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 20),
          )),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 17, right: 17),
            child: TextFormField(
              onChanged: (value) => _email = value,
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
                "Set Password",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              onPressed: () async {
                if (_email == null || _email == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("E-mail address is Empty "),
                    backgroundColor: Colors.blueGrey,
                  ));
                } else {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      });

                  try {
                    _auth.sendPasswordResetEmail(email: _email.trim());
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("password Reset, E-mail sent "),
                      backgroundColor: Colors.blueGrey,
                    ));

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                  } on FirebaseAuthException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.message),
                      backgroundColor: Colors.blueGrey,
                    ));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                  }
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
          return noInternet();
        }
      },
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.teal[700],
      )),
    );
  }
}

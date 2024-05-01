import 'package:delicyfood/presentation/screens/admin/adminPage.dart';
import 'package:delicyfood/presentation/screens/all_pages/home.dart';
import 'package:delicyfood/presentation/screens/all_pages/resetPassword.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/data_source/Data_Api.dart';
import '../../../data/models/driver.dart';
import '../../../data/repository/repository.dart';
import '../../screens/all_pages/marketPage.dart';
import '../../screens/driver/driver_orders.dart';

class FirstHave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign In",
            style: TextStyle(
                fontSize: 48, fontWeight: FontWeight.w900, color: Colors.teal),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Welcome To Our App",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w400, color: Colors.teal),
          ),
        ],
      ),
    );
  }
}

class SecondHave extends StatefulWidget {
  const SecondHave({super.key});

  @override
  State<SecondHave> createState() => _SecondHaveState();
}

class _SecondHaveState extends State<SecondHave> {
  Data_api? _data_api;
  Products_repository? repo;

  final _auth = FirebaseAuth.instance;
  static String _emaill = "";

  static String _passw = "";

  TextEditingController emailr = TextEditingController();
  TextEditingController passr = TextEditingController();

  @override
  void initState() {
    super.initState();
    _data_api = Data_api();
    repo = Products_repository(_data_api!);
  }

  _saveData(bool state) async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();

    shared_data.setBool("STATE", state);
  }

  _saveDataa(String name, String username, String Pass, String number,
      bool state, String user_ID) async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    shared_data.setString("NAME", name);
    shared_data.setString("USERNAME", username);
    shared_data.setString("PASS", Pass);
    shared_data.setString("NUMBER", number);
    shared_data.setBool("STATE", state);
    shared_data.setString("USERID", user_ID);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 17, right: 17),
            child: TextFormField(
//controller: emailr,
              onChanged: (value) => _emaill = value,
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
                _passw = value;
              },
//controller: passr,
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
            height: 70,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResetPassword();
              }));
            },
            child: Text(
              "Forget My Password..?",
              style: TextStyle(
                  color: Colors.teal[300],
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 3 + 55,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width / 2,
              height: 50,
              color: Colors.teal,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                "Sign In",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              onPressed: () async {
                try {
                  if (_passw == "" && _emaill == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Both E-mail address and Password is Empty "),
                      backgroundColor: Colors.blueGrey,
                    ));
                  } else if (_emaill == null || _emaill == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("E-mail address is Empty "),
                      backgroundColor: Colors.blueGrey,
                    ));
                  } else if (_passw == null || _passw == "") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("password  is Empty "),
                      backgroundColor: Colors.blueGrey,
                    ));
                  } else {
                    final UserCredential userCredential =
                        await _auth.signInWithEmailAndPassword(
                            email: _emaill.trim(), password: _passw.trim());

                    final User? user = userCredential.user;

                    String? id = user!.uid;
                    String? email = user!.email;

                    if (userCredential != null) {
                      _saveDataa("", _emaill, _passw, "", true, id!);
                      _saveData(true);

                      String check = await repo!.checkDriver(email!);

                      if (check == "true") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return driver_Orders();
                            },
                          ),
                        );
                      }  else if (_emaill == "market@gmail.com" &&
                          _passw == "999999") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return marketPage();
                            },
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Home();
                            },
                          ),
                        );
                      }
                    }
                  }
                } on FirebaseAuthException catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(error.message!),
                    backgroundColor: Colors.blueGrey,
                  ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kids/presentation/screens/login.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../screens/HomeScreen.dart';
import '../screens/register.dart';
import '../screens/resetPassword.dart';

class SecondHave extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  static String _emaill = "";
  static String _passw = "";

  TextEditingController emailr = TextEditingController();
  TextEditingController passr = TextEditingController();

  _saveData(String name, String username, String phone, bool state) async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    shared_data.setString("NAME", name);
    shared_data.setString("USERNAME", username);
    shared_data.setString("PHONE", phone);
    shared_data.setBool("STATE", state);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      elevation: 400,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.w), topRight: Radius.circular(10.w)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 8.h),
              child: TextFormField(
//controller: emailr,
                onChanged: (value) {
                  _emaill = value;
                  Login().email = value;
                },
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.w),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: "E-mail address",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.grey[800],
                      size: 6.w,
                    )),
              ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w, right: 4.w),
              child: TextFormField(
                onChanged: (value) {
                  _passw = value;
                },
//controller: passr,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.w),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Color(0xFFe7edeb),
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey[800],
                      size: 6.w,
                    )),
              ),
            ),
            SizedBox(
              height: 8.h,
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
                      color: Colors.amberAccent[700],
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                )),
            SizedBox(
              height: 2.5.h,
            ),
            Container(
              height: 7.h,
              width: 50.w,
              child: MaterialButton(
                minWidth: 50.w,
                height: 7.h,
                color: Colors.amberAccent[700],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.w)),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () async {
                  try {
                    if (_passw == "" && _emaill == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("Both E-mail address and Password are Empty "),
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
                      final user = await _auth.signInWithEmailAndPassword(
                          email: _emaill.trim(), password: _passw.trim());
                      if (user != null) {
                        _saveData("", _emaill, _passw, true);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return home();
                            },
                          ),
                        );
                      } else {
                        showSimpleNotification(
                            Text(
                              "No Internet",
                              style: TextStyle(color: Colors.white),
                            ),
                            background: Colors.red);
                      }
                    }
                  } on FirebaseAuthException catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(error.message),
                      backgroundColor: Colors.blueGrey,
                    ));
                  }
                },
              ),
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Register();
                  }));
                },
                child: Container(
                  color: Colors.white,
                  height: 4.h,
                  width: 50.w,
                  child: Text(
                    "Create free account..!",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.amberAccent[700],
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

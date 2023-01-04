import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:kids/presentation/screens/hasNo_Internet.dart';
import 'package:kids/presentation/widgets/secondHave.dart';
import 'package:sizer/sizer.dart';

class Login extends StatefulWidget {
  String email = "";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget page() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () {
            SystemNavigator.pop();
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                firstHave(),
                Container(height: 67.h, child: SecondHave()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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

class firstHave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.w),
            bottomRight: Radius.circular(10.w)),
        color: Colors.amberAccent[700],
      ),
      width: 100.w,
      height: 33.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Sign In",
            style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.w900,
                color: Colors.white),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Text(
            "Learn More with Us",
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}

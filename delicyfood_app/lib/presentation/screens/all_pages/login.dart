import 'package:delicyfood/presentation/widgets/login/loginWidgets.dart';
import 'register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () {
          SystemNavigator.pop();
        },
        child: ListView(children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Register();
                      }));
                    },
                    child: Container(
                      color: Colors.white,
                      height: 50,
                      width: 65,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w400,
                            fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
              firstHave(),
              Container(
                  height: MediaQuery.of(context).size.height / 3 +
                      MediaQuery.of(context).size.height / 3,
                  child: secondHave())
            ],
          ),
        ]),
      ),
    );
  }
}

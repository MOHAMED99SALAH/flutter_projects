import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key key}) : super(key: key);

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          title: Text(
            "No Internet ",
            style: TextStyle(color: Colors.teal[700]),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Container()),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Can\'t connect .. check internet',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.teal[700],
                ),
              ),
              Image.asset("images/undraw_No_data_re_kwbl (1).png"),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

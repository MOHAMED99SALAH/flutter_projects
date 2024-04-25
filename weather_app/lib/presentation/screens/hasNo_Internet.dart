import 'package:flutter/material.dart';

class NoInternet extends StatefulWidget {
  const NoInternet();

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
            style: TextStyle(color: Colors.blueGrey),
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
                  color: Colors.blueGrey,
                ),
              ),
              Image.asset("assets/noInternet.png"),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

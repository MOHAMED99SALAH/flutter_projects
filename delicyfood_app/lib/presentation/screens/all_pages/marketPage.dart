import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../admin/adminPage.dart';
import '../market/orders.dart';

class marketPage extends StatefulWidget {
  @override
  State<marketPage> createState() => _marketPageState();
}

class _marketPageState extends State<marketPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text(
              "market ",
              style: TextStyle(color: Colors.teal[700]),
            ),
            leading: IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.teal[700],
                size: 25,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true),
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 50,
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "admin page ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AdminPage();
                      },
                    ),
                  );
                }),
            SizedBox(
              height: 50,
            ),
            MaterialButton(
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 50,
                color: Colors.teal,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Orders",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Orders();
                      },
                    ),
                  );
                }),
          ],
        )),
      ),
    );
  }
}

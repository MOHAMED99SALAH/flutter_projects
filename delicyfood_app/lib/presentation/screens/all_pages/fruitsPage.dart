import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/presentation/screens/all_pages/hasNo_Internet.dart';
import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/advertisement.dart';
import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/search.dart';
import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/shapeItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class fruits extends StatefulWidget {
  @override
  _fruitsState createState() => _fruitsState();
}

class _fruitsState extends State<fruits> {
  Widget page() {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Fruits",
          style: TextStyle(color: Colors.teal[700]),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.teal[700],
              size: 25,
            )),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate:
                        dataSearch(data: productListItem_fruits.list_categ));
              },
              icon: Icon(
                Icons.search,
                color: Colors.teal[700],
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 3, right: 3),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              advertisement("images/fruits_advetise.png", " Fruits",
                  "delivery in 15 minutes", "free"),
              SizedBox(
                height: 20,
              ),
              for (var product in productListItem_fruits.list_categ)
                Shape(product)
            ],
          ),
        ),
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

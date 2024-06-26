import 'package:delicyfood/presentation/widgets/global_widgets/SideBar.dart';
import 'package:delicyfood/presentation/widgets/home/category.dart';
import 'package:delicyfood/presentation/widgets/home/image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/product.dart';
import '../../widgets/cart/soldItems.dart';
import 'getstart.dart';
import 'Cart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<Product>? itmes_sold;
  @override
  void initState() {
    _loadData();
  }

  _loadData() async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    setState(() {
      if (shared_data.getString("NAME") != "" ||
          shared_data.getString("NUMBER") != "" ||
          shared_data.getString("PASS") != "" ||
          shared_data.getBool("STATE") == false) {
        Getstart.Name = shared_data.getString("NAME");
        Getstart.name_user = shared_data.getString("USERNAME");
        Getstart.password = shared_data.getString("PASS");
        Getstart.number = shared_data.getString("NUMBER");
        Getstart.state = shared_data.getBool("STATE");
      } else {
        Getstart.Name = "";
        Getstart.name_user = "";
        Getstart.password = "";
        Getstart.number = "";
        Getstart.state = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double? ReallyWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        bool value = true;
        if (value == true) {
          SystemNavigator.pop();
        }
        return value;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Cart();
                }));
              },
              icon: Icon(Icons.shopping_cart),
              color: Colors.teal[700],
            )
          ],
          title: Text(
            "delicyfood",
            style: TextStyle(color: Colors.teal[700]),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.view_headline,
                  color: Colors.teal[700],
                  size: 25,
                ));
          }),
        ),
        drawer: Sidebar(),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 12),
              image("images/head.png"),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.only(left: 19, right: 8),
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Categories...!",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.teal[700]),
                        ),
                        Container(
                          width: ReallyWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Categorey(
                                  "images/vege.png", "vegetables"),
                              SizedBox(
                                width: 15,
                              ),
                              Categorey("images/fruits.png", "Fruits"),
                              SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        image("images/getstartAnimation.gif"),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

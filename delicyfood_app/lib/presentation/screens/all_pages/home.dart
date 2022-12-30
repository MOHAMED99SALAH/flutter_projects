import 'package:delicyfood/presentation/widgets/global_widgets/SideBar.dart';
import 'package:delicyfood/presentation/widgets/home/category.dart';
import 'package:delicyfood/presentation/widgets/home/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'getstart.dart';
import 'Cart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
        getstart.Name = shared_data.getString("NAME");
        getstart.name_user = shared_data.getString("USERNAME");
        getstart.password = shared_data.getString("PASS");
        getstart.number = shared_data.getString("NUMBER");
        getstart.state = shared_data.getBool("STATE");
      } else {
        getstart.Name = "";
        getstart.name_user = "";
        getstart.password = "";
        getstart.number = "";
        getstart.state = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
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
        drawer: sidebar(),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              SizedBox(height: 12),
              image("images/advertise.png"),
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
                              categorey(
                                  "images/vegetables_home.png", "vegetables"),
                              SizedBox(
                                width: 15,
                              ),
                              categorey("images/fruits_home.png", "Fruits"),
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

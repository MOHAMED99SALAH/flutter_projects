import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/presentation/screens/all_pages/hasNo_Internet.dart';
import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/advertisement.dart';
import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/search.dart';
import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/shapeItem.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter/material.dart';

class Vegetables extends StatefulWidget {
  static bool buy = false;

  @override
  _VegetablesState createState() => _VegetablesState();
}

class _VegetablesState extends State<Vegetables> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget page() {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.teal[700],
              size: 25,
            )),
        title: Text(
          "vegetables",
          style: TextStyle(color: Colors.teal[700]),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: DataSearch(
                        data: productListItem_vegetables.list_categ));
              },
              icon: Icon(
                Icons.search,
                color: Colors.teal[700],
              ))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 3, left: 3),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(
                height: 6,
              ),
              Advertisement("images/vegetables_advertise.png", " vegetables",
                  "delivery in 15 minutes", "free"),
              SizedBox(
                height: 20,
              ),

              for (var pro in productListItem_vegetables.list_categ) Shape(pro),

              //  FutureBuilder(
              //   future: products_repository(data_api()).getvege(),
              //   builder: (context, snapshot) {
              //    List<product> p = snapshot.data;

              //    return Text("${
              //   p.length
              //    }");
              //  }),
            ],
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

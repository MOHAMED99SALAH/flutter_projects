import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/presentation/screens/all_pages/hasNo_Internet.dart';
import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/advertisement.dart';
import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/search.dart';
import 'package:delicyfood/presentation/widgets/vegetables_and_fruits/shapeItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../data/data_source/Data_Api.dart';
import '../../../data/repository/repository.dart';

class Fruits extends StatefulWidget {
  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  Data_api? _data_api;
  Products_repository? repo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data_api = new Data_api();
    repo = new Products_repository(_data_api!);
  }

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
                    delegate: DataSearch(productListItem_fruits.list_categ));
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
              Advertisement("images/fruits_advetise.png", " Fruits",
                  "delivery in 15 minutes", "free"),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: repo!.getfruits(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Column(
                        children: <Widget>[
                          SizedBox(
                            height: 200,
                          ),
                          Center(
                              child: LoadingAnimationWidget.inkDrop(
                            color: Colors.teal[700]!,
                            size: 45,
                          ))
                        ],
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Shape(snapshot.data[index]);
                          });
                    }
                  }),
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

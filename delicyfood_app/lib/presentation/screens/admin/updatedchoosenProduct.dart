import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/widgets/admin/updateShape.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../data/data_source/Data_Api.dart';

class ChooseUpdateProduct extends StatefulWidget {
  @override
  State<ChooseUpdateProduct> createState() => _ChooseUpdateProductState();
}

class _ChooseUpdateProductState extends State<ChooseUpdateProduct> {
  Data_api? _data_api;
  Products_repository? repo;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data_api = new Data_api();
    repo = new Products_repository(_data_api!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
            title: Text(
              "update Product ",
              style: TextStyle(color: Colors.teal[700]),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.teal[700],
                size: 25,
              ),
            ),
            backgroundColor: Colors.white,
            centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.teal[200],
                  ),
                  height: 70,
                  width: double.infinity,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      "Note : Scroll horizontally and Enter ID of item you want to update.",
                    ),
                  )),
                ),
              ),
              SizedBox(
                height: 90,
              ),
              Text(
                "Vegetables",
                style: TextStyle(
                    color: Colors.teal[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: FutureBuilder(
                    future: repo!.getvege(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Column(
                          children: <Widget>[
                            Center(
                                child: LoadingAnimationWidget.inkDrop(
                              color: Colors.teal[700]!,
                              size: 45,
                            ))
                          ],
                        );
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(2),
                          itemCount: snapshot.data.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 2,
                            );
                          },
                          itemBuilder: (context, index) {
                            return UpdateShape(snapshot.data[index]);
                          },
                        );
                      }
                    }),
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                "Fruits",
                style: TextStyle(
                    color: Colors.teal[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 150,
                child: FutureBuilder(
                    future: repo!.getfruits(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.data == null) {
                        return Column(
                          children: <Widget>[
                            Center(
                                child: LoadingAnimationWidget.inkDrop(
                              color: Colors.teal[700]!,
                              size: 45,
                            ))
                          ],
                        );
                      } else {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(2),
                          itemCount: snapshot.data.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: 2,
                            );
                          },
                          itemBuilder: (context, index) {
                            return UpdateShape(snapshot.data[index]);
                          },
                        );
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}

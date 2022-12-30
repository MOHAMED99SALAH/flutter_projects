import 'package:delicyfood/data/data_source/Data_Api.dart';
import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/presentation/screens/all_pages/fruitsPage.dart';
import 'package:delicyfood/presentation/screens/all_pages/vegetablePage.dart';
import 'package:flutter/material.dart';

class categorey extends StatefulWidget {
  final String image;
  final String resName;

  categorey(this.image, this.resName);

  @override
  _categoreyState createState() => _categoreyState();
}

class _categoreyState extends State<categorey> {
  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width / 3;
    double _height = 180;

    // TODO: implement build
    return GestureDetector(
      onTap: () {


        if (widget.resName == "vegetables") {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return vege_catg();
          }));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return fruits();
          }));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[100],
        ),
        height: _height,
        width: ReallyWidth,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.fill,
          )),
        ),
      ),
    );
  }
}

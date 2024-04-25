import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:delicyfood/presentation/screens/all_pages/Cart.dart';
import 'package:delicyfood/presentation/screens/all_pages/vegetablePage.dart';
import 'package:flutter/material.dart';
import '../../../business/bloc/bloc.dart';
import '../../../data/models/product.dart';
import '../cart/soldItems.dart';

class Advertisement extends StatefulWidget {
  final String image;
  final String resName;
  final String Description;
  final String status;

  Advertisement(this.image, this.resName, this.Description, this.status);

  @override
  _AdvertisementState createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation? _animation;

  final CartBloc bloc = BlocProvider.getBloc<CartBloc>();
  List<Product> fooditems1 = [];

  @override
  void initState() {
    // TODO: implement initState
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 210))
          ..repeat();
    _animation = Tween(begin: 50.0, end: 200.0).animate(_animationController!)
      ..addStatusListener((status) {})
      ..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return StreamBuilder(
        stream: bloc.ListStream,
        builder: (context, snapshop) {
          if (snapshop.data != null) {
            fooditems1 = (snapshop.data) as List<Product>;
          }
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.teal[100],
            ),
            height: 176,
            width: ReallyWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      image: DecorationImage(
                        image: AssetImage(widget.image),
                        fit: BoxFit.fill,
                      )),
                  height: 400,
                  width: 204.6,
                ),
                SizedBox(
                  width: 3,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Text(widget.resName,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold)),
                        Icon(Icons.all_inclusive_rounded),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(widget.Description,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(widget.status,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                                color: Colors.black87)),
                        Transform.rotate(
                          angle: 3.14 / 2 * _animation!.value,
                          child: Icon(Icons.delivery_dining),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Cart();
                        }));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: 170,
                        height: 52,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Orders",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: <Widget>[
                                fooditems1.isNotEmpty
                                    ? Container(
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                        ),
                                        constraints: BoxConstraints(
                                          minWidth: 16,
                                          minHeight: 16,
                                        ),
                                        child: Text(
                                          fooditems1!.length.toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : Container(
                                        color: Colors.teal,
                                        constraints: BoxConstraints(
                                          minWidth: 16,
                                          minHeight: 16,
                                        ),
                                      ),
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

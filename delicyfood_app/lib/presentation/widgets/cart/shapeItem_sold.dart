import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delicyfood/business/bloc/bloc.dart';
import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/business/bloc/centralProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShapeItem_Sold extends StatefulWidget {
  product productt2;

  ShapeItem_Sold(this.productt2);

  @override
  _ShapeItem_Sold createState() => _ShapeItem_Sold(productt2);
}

class _ShapeItem_Sold extends State<ShapeItem_Sold> {
  product productt3;
  double q = 0;

  final CartBloc bloc = BlocProvider.getBloc<CartBloc>();

  _ShapeItem_Sold(this.productt3);

  @override
  Widget build(BuildContext context) {
    q = productt3.quantity;
    double ReallyWidth = MediaQuery.of(context).size.width;
    var cost = Provider.of<TotalPrice>(context, listen: false);
    return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          height: 112,
          width: ReallyWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(productt3.name,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    width: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: MaterialButton(
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                              setState(() {
                                if (productt3.quantity == 1) {}
                                if (productt3.quantity > 1) {
                                  cost.decremnt(productt3.price);
                                  productt3.decrementQ();

                                  setState(() {
                                    q--;
                                  });
                                }
                              });
                            },
                          ),
                        ),
                        Text(
                          "${q}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 25),
                        ),
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: MaterialButton(
                            child: Text(
                              "+",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                              setState(() {
                                cost.icremnt(productt3.price);
                                productt3.incrementQ();

                                setState(() {
                                  q++;
                                });
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              CachedNetworkImage(
                imageUrl: productt3.imagePath,
                imageBuilder: (context, imageProvider) => Container(
                  height: 145,
                  width: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.contain,
                  )),
                ),
                placeholder: ((context, url) => Container(
                      height: 145,
                      width: 130,
                      child: Image.asset("images/99274-loading.gif"),
                    )),
                errorWidget: ((context, url, error) => Container(
                      height: 145,
                      width: 130,
                      child: Image.asset("images/99274-loading.gif"),
                    )),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
        ));
  }
}

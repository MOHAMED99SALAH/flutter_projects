import 'package:bagshop/data/models/model.dart';
import 'package:bagshop/presentation/widgets/widgets_detail_page/addToCart.dart';
import 'package:bagshop/presentation/widgets/widgets_detail_page/color.dart';
import 'package:bagshop/presentation/widgets/widgets_detail_page/counter.dart';
import 'package:bagshop/presentation/widgets/widgets_detail_page/description.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  final Product product;
  const Body({Key key, this.product}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 3),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 57,
                            ),
                            ColorAndSize(product: widget.product),
                            SizedBox(height: 15),
                            Description(product: widget.product),
                            SizedBox(height: 15),
                            CounterWithFavBtn(),
                            SizedBox(height: 25),
                            AddToCart(product: widget.product)
                          ],
                        ),
                      )),
                ),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 17),
                            child: Text(
                              "Aristocratic Hand Bag",
                              style: TextStyle(color: Colors.white),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              "${widget.product.title}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: "Price\n"),
                                    TextSpan(
                                      text: "\$${widget.product.price}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 20),
                                child: Hero(
                                  tag: "${widget.product.id}",
                                  child: Image.asset(
                                    widget.product.image,
                                    fit: BoxFit.fill,
                                    height:
                                        MediaQuery.of(context).size.height / 3,
                                    width:
                                        MediaQuery.of(context).size.height / 5,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String hotel;
  final String itemName;
  final double itemPrice;
  final String imgUrl;
  final bool leftalign;

  Item(
      {this.hotel, this.itemName, this.itemPrice, this.imgUrl, this.leftalign});

  @override
  Widget build(BuildContext context) {
    final double containerpadding = 45;
    final double containerpaddingradios = 10;
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: leftalign ? 0 : containerpadding,
              right: leftalign ? containerpadding : 0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                    left: leftalign
                        ? Radius.circular(0)
                        : Radius.circular(containerpaddingradios),
                    right: leftalign
                        ? Radius.circular(containerpaddingradios)
                        : Radius.circular(0),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: leftalign ? 20 : 0, right: leftalign ? 0 : 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          itemName,
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        )),
                        Text(
                          "\$$itemPrice",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: containerpadding,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                            style:
                                TextStyle(color: Colors.black45, fontSize: 10),
                            children: [
                              TextSpan(
                                  text: "by",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15)),
                              TextSpan(
                                  text: hotel,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15))
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

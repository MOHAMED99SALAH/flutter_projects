import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delicyfood/business/bloc/bloc.dart';
import 'package:delicyfood/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:delicyfood/presentation/screens/all_pages/vegetablePage.dart';

class Shape extends StatelessWidget {
  Product productt;

  final CartBloc bloc = BlocProvider.getBloc<CartBloc>();
  addtocart(Product fooditem) {
    bloc.addtolist(fooditem);
  }

  Shape(this.productt);

  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        addtocart(productt);

        Vegetables.buy = true;

        SnackBar snackBar = SnackBar(
          content: Text("${productt.name} added successfully"),
          backgroundColor: Colors.blueGrey,
          duration: Duration(milliseconds: 400),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        height: 90,
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
                Text(productt.name!,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 8,
                ),
                Text(" 1 Kg ->  ${productt.price} LE",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87)),
              ],
            ),
            SizedBox(
              width: 52,
            ),
            CachedNetworkImage(
              imageUrl: productt.imagePath!,
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
      ),
    );
  }
}

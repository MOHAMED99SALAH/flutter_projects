import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/presentation/widgets/cart/shapeItem_sold.dart';
import 'package:delicyfood/business/bloc/centralProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delicyfood/presentation/screens/all_pages/vegetablePage.dart';


class Listproducts_sold extends StatefulWidget {
  static List<Product> itmes_sold;

  Listproducts_sold(itmes) {
    itmes_sold = itmes;
  }

  @override
  _Listproducts_soldState createState() => _Listproducts_soldState();
}

class _Listproducts_soldState extends State<Listproducts_sold> {
  @override
  @override
  Widget build(BuildContext context) {
    var cost = Provider.of<TotalPrice>(context, listen: false);
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: Listproducts_sold.itmes_sold.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(Listproducts_sold.itmes_sold[index].name),
              onDismissed: (direction) {
                setState(() {
                  cost.decremnt(Listproducts_sold.itmes_sold[index].price *
                      Listproducts_sold.itmes_sold[index].quantity);
                  Listproducts_sold.itmes_sold.removeAt(index);
                  setState(() {
                    if (Listproducts_sold.itmes_sold.length == 0) {
                      Vegetables.buy = false;
                    } else {
                      Vegetables.buy = true;
                    }
                  });
                });
              },
              child: ShapeItem_Sold(Listproducts_sold.itmes_sold[index]));
        });
  }
}

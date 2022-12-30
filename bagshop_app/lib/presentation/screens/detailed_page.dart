import 'package:bagshop/presentation/widgets/widgets_detail_page/body.dart';
import 'package:flutter/material.dart';
import '../../data/models/model.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(
          Icons.search,
          color: Colors.white,
        )),
        IconButton(
            icon: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        )),
        SizedBox(width: 10 / 2)
      ],
    );
  }
}

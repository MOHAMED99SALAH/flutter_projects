import 'package:flutter/material.dart';

import '../../../data/models/model.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final VoidCallback press;

  const ItemCard(
    this.product,
    this.press,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 240,
              height: 320,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: product.color,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10 / 4),
              child: Text(
                product.title,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Text(
              "\$${product.price}",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          width: 10,
        )
      ]),
    );
  }
}

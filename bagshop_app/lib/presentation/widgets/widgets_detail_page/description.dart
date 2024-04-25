import 'package:flutter/material.dart';
import '../../../data/models/model.dart';

class Description extends StatelessWidget {
  const Description(
    this.product,
  );

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        product.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}

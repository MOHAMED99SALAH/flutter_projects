import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/models/soldProduct.dart';

import 'orderID.dart';

class OrderDetail {
  final OrderId orderID;
  final Product product;
  final int quantity;

  OrderDetail({
    required this.orderID,
    required this.product,
    required this.quantity,
  });

  factory OrderDetail.fromJson(Map<String, dynamic> json) {
    return OrderDetail(
      orderID: OrderId.fromJson(json['orderID']),
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
}

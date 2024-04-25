class OrderId {
  final int orderID;
  final int productID;

  OrderId({
    required this.orderID,
    required this.productID,
  });

  factory OrderId.fromJson(Map<String, dynamic> json) {
    return OrderId(
      orderID: json['orderID'],
      productID: json['productID'],
    );
  }
}

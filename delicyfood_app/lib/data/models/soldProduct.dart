class SoldProduct {
  int? productID;
  String? name;
  String? price;
  int? quantity;
  String? imagePath;
  int? cat_id;

  SoldProduct(
      {this.productID,
      this.name,
      this.price,
      this.quantity,
      this.imagePath,
      this.cat_id});

  SoldProduct.fromJson(Map<String, dynamic> list) {
    this.productID = list['orderID']['orderID'];
    this.name = list['product']['name'];
    this.price = list['product']['price'];
    this.quantity = list['quantity'];
    this.imagePath = list['product']['imagePath'];
    this.cat_id = list['product']['cat_id'];
  }
}

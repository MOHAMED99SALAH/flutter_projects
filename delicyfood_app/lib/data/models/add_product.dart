import 'dart:convert';

Added_product productModelJson(String str) =>
    Added_product.fromJson(json.decode(str));
String productTojson(Added_product data) => json.encode(data.toJson());

class Added_product {
  String? name;
  String? price;
  String? quantity;
  String? imagePath;
  String? catgID;
  Added_product(
      this.imagePath, this.name, this.price, this.quantity, this.catgID);

  Added_product.fromJson(Map<String, dynamic> list) {
    this.name = list['name'];
    this.price = list['price'];
    this.quantity = list['quantity'];
    this.imagePath = list['imagePath'];
    this.catgID = list['cat_id'];
  }

  Map<String, dynamic> toJson() => {
        "name": this.name,
        "price": this.price,
        "quantity": this.quantity,
        "imagePath": this.imagePath,
        "cat_id": this.catgID
      };
}

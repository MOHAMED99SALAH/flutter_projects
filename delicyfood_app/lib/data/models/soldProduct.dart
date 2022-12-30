class soldProduct {
  int orderID;
  int productID;
  String name;
  String price;
  int quantity;
  String imagePath;
  int cat_id;

  soldProduct(this.orderID, this.productID, this.name, this.price,
      this.quantity, this.imagePath, this.cat_id);

  soldProduct.fromJson(Map<String, dynamic> list) {
    this.orderID = list['orderID']['orderID'];
    this.productID = list['orderID']['productID'];
    this.name = list['product']['name'];
    this.price = list['product']['price'];
    this.quantity = list['quantity'];
    this.imagePath = list['product']['imagePath'];
    this.cat_id = list['product']['cat_id'];
  }
}

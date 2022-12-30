class FoodItemList {
  List<FoodItem> foodItems;
  FoodItemList({this.foodItems});
}

class FoodItem {
  int id;
  String title;
  String hotel;
  double price;
  String imgUrl;
  int quantity;

  FoodItem(
      {this.id,
      this.title,
      this.hotel,
      this.price,
      this.imgUrl,
      this.quantity = 1});

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}

class listitem {
  List<FoodItem> foodlist;

  listitem({this.foodlist});
}

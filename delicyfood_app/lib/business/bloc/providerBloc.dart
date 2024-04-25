import '../../data/models/product.dart';

class CartProvider {
  List<Product> fooditems = [];

  List<Product> addtolist(Product foodItem) {
    bool ispresent = false;
    if (fooditems.length > 0) {
      for (int i = 0; i < fooditems.length; i++) {
        if (fooditems[i].name == foodItem.name) {
          fooditems[i].incrementQ();
          ispresent = true;
          break;
        } else {
          ispresent = false;
        }
      }
      if (!ispresent) {
        foodItem.quantity=1;
        fooditems.add(foodItem);
      }
    } else {
      foodItem.quantity=1;
      fooditems.add(foodItem);
    }
    return fooditems;
  }

  List<Product> removefromlist(Product foodItem) {
    if (fooditems.length > 0) {
      for (int i = 0; i < fooditems.length; i++) {
        if (fooditems[i].name == foodItem.name) {
          if (foodItem.quantity! > 1) {
            fooditems[i].decrementQ();
          } else {
            fooditems.remove(foodItem);
          }
        }
      }
    }

    return fooditems;
  }
}

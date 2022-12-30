import '../../data/models/product.dart';

class CartProvider {
  List<product> fooditems = [];

  List<product> addtolist(product foodItem) {
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
        fooditems.add(foodItem);
      }
    } else {
      fooditems.add(foodItem);
    }

    return fooditems;
  }

  List<product> removefromlist(product foodItem) {
    if (fooditems.length > 0) {
      for (int i = 0; i < fooditems.length; i++) {
        if (fooditems[i].name == foodItem.name) {
          if (foodItem.quantity > 1) {
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

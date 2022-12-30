import '../../data/modules/foodItem.dart';

class CartProvider {

  List<FoodItem> fooditems =[];

  List<FoodItem> addtolist (FoodItem foodItem)
  {
    bool ispresent =false;
    if(fooditems.length>0)
      {
       for (int i =0; i<fooditems.length;i++) {
         if (fooditems[i].id == foodItem.id) {
           icrementquantity(foodItem);
           ispresent = true;
           break;
         }
         else {
           ispresent = false;
         }
       }
         if (!ispresent) {
           fooditems.add(foodItem);
         }

      }
    else
      {
        fooditems.add(foodItem);
      }

    return fooditems;
  }

  void icrementquantity(FoodItem foodItem) => foodItem.incrementQuantity();
  void dcrementquantity(FoodItem foodItem) => foodItem.decrementQuantity();

  List<FoodItem> removefromlist (FoodItem foodItem)
  {

    if(foodItem.quantity>=1)
      {
        dcrementquantity(foodItem);
      }
    else {
      fooditems.remove(foodItem);
    }
    return fooditems;
  }

}
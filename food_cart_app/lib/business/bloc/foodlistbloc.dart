import 'package:bloc_pattern/bloc_pattern.dart';
import 'provider.dart';
import 'dart:async';

import '../../data/modules/foodItem.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();
  var _ListControler = BehaviorSubject<List<FoodItem>>.seeded([]);
  CartProvider provider = CartProvider();
//out
  Stream<List<FoodItem>> get ListStream => _ListControler.stream;
// in
  Sink<List<FoodItem>> get ListSink => _ListControler.sink;

  addtolist(FoodItem fooditem) {
    ListSink.add(provider.addtolist(fooditem));
  }

  removefromlist(FoodItem fooditem) {
    ListSink.add(provider.removefromlist(fooditem));
  }

  @override
  void dispose() {
    // will be called automatically
    _ListControler.close();
    super.dispose();
  }
}

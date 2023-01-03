import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import '../../data/models/product.dart';
import 'providerBloc.dart';

class CartBloc extends BlocBase {
  CartBloc();
  var _ListControler = BehaviorSubject<List<Product>>.seeded([]);
  CartProvider provider = CartProvider();
//out
  Stream<List<Product>> get ListStream => _ListControler.stream;
// in
  Sink<List<Product>> get ListSink => _ListControler.sink;

  addtolist(Product fooditem) {
    ListSink.add(provider.addtolist(fooditem));
  }

  removefromlist(Product fooditem) {
    ListSink.add(provider.removefromlist(fooditem));
  }

  @override
  void dispose() {
    // will be called automatically
    _ListControler.close();
    super.dispose();
  }
}

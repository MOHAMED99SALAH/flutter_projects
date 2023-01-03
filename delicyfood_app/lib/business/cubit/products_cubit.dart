import 'package:bloc/bloc.dart';
import 'package:delicyfood/data/models/product.dart';
import 'package:meta/meta.dart';

import '../../data/repository/repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  Products_repository repository;

  ProductsCubit(this.repository) : super(ProductsInitial());

  Future<List<Product>> getfruits() async {
    List<Product> products = [];

    await repository.getfruits().then((productts) {
      emit(FruitsLoaded(products));
      products = productts;
    });

    return products;
  }

  Future<List<Product>> getVegetables() async {
    List<Product> products = [];
    await repository.getfruits().then((productts) {
      emit(VegetablesLoaded(products));
      products = productts;
    });
    return products;
  }
}

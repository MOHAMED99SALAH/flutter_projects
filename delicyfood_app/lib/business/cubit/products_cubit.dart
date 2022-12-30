import 'package:bloc/bloc.dart';
import 'package:delicyfood/data/models/product.dart';
import 'package:meta/meta.dart';

import '../../data/repository/repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  products_repository repository;

  ProductsCubit(this.repository) : super(ProductsInitial());

  Future<List<product>> getfruits() async {
    List<product> products = [];

    await repository.getfruits().then((productts) {
      emit(fruitsLoaded(products));
      products = productts;
    });

    return products;
  }

  Future<List<product>> getVegetables() async {
    List<product> products = [];
    await repository.getfruits().then((productts) {
      emit(vegetablesLoaded(products));
      products = productts;
    });
    return products;
  }
}

part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class FruitsLoaded extends ProductsState {
  final List<Product> products;

  FruitsLoaded(this.products);
}

class VegetablesLoaded extends ProductsState {
  final List<Product> products;

  VegetablesLoaded(this.products);
}

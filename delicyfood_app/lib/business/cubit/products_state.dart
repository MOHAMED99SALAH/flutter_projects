part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class fruitsLoaded extends ProductsState {
  final List<product> products;

  fruitsLoaded(this.products);
}

class vegetablesLoaded extends ProductsState {
  final List<product> products;

  vegetablesLoaded(this.products);
}

import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/models/soldProduct.dart';

import '../data_source/Data_Api.dart';

class products_repository {
  final data_api data;

  products_repository(this.data);

  Future<List<product>> getfruits() async {
    List<product> products = await data.getDataFruits();

    return products;
  }

  Future<List<product>> getvege() async {
    List<product> products = await data.getDataVege();
    return products;
  }

  Future<List<soldProduct>> getLastOrder() async {
    List<soldProduct> products = await data.getLastOrder();
    return products;
  }

  Future<bool> addOrder(List<product> products ,int total_price,String location) async {
    return data.addorder(products ,total_price,location);
  }

  Future<bool> addProduct(product product) async {
    return data.addProduct(product);
  }

  Future<bool> updateProduct(product product) async {
    return data.updateProduct(product);
  }

  Future<bool> deleteProduct(int id) async {
    return data.deleteProduct(id);
  }
}

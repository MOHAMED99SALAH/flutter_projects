import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/models/soldProduct.dart';

import '../data_source/Data_Api.dart';

class Products_repository {
  final Data_api data;

  Products_repository(this.data);

  Future<List<Product>> getfruits() async {
    List<Product> products = await data.getDataFruits();

    return products;
  }

  Future<List<Product>> getvege() async {
    List<Product> products = await data.getDataVege();
    return products;
  }

  Future<List<SoldProduct>> getLastOrder() async {
    List<SoldProduct> products = await data.getLastOrder();
    return products;
  }

  Future<bool> addOrder(List<Product> products ,int total_price,String location) async {
    return data.addorder(products ,total_price,location);
  }

  Future<bool> addProduct(Product product) async {
    return data.addProduct(product);
  }

  Future<bool> updateProduct(Product product) async {
    return data.updateProduct(product);
  }

  Future<bool> deleteProduct(int id) async {
    return data.deleteProduct(id);
  }
}

import 'package:delicyfood/data/models/product.dart';
import '../data_source/Data_Api.dart';
import '../models/Order.dart';
import '../models/add_product.dart';
import '../models/driver.dart';

class Products_repository {
  Data_api data;

  Products_repository(this.data);

  Future<List<Product>> getfruits() async {
    List<Product> products = await data.getDataFruits();

    return products;
  }

  Future<List<Product>> getvege() async {
    List<Product> products = await data.getDataVege();
    return products;
  }

  Future<List<Order>> getOrders() async {
    List<Order> orders = await data.getOrders();
    return orders;
  }

  Future<List<Order>> getLastOrders() async {
    List<Order> orders = await data.get_last_Orders();
    return orders;
  }

  Future<List<Order>> getOrdersbyDriver(String? email) async {
    List<Order> orders = await data.getOrdersOfDriver(email);
    return orders;
  }

  Future<bool> addOrder(List<Product> products, int total_price, String address,
      String phone) async {
    return data.addorder(products, total_price, address, phone);
  }

  Future<bool> updateMarketStatus(int id) async {
    return data.updateMarketStatus(id);
  }

  Future<bool> updateDriverStatusOforder(int id) async {
    return data.updateDriverStatusOforder(id);
  }

  Future<bool> updateDriverOforder(int id, driver entity) async {
    return data.updateDriverOforder(id, entity);
  }

  Future<bool> updateDriverStatus(String? email, bool status) async {
    return data.updateDriverStatus(email, status);
  }

  Future<bool> addProduct(Added_product product) async {
    return data.addProduct(product);
  }

  Future<bool> updateProduct(Product product) async {
    return data.updateProduct(product);
  }

  Future<bool> deleteProduct(int id) async {
    return data.deleteProduct(id);
  }

  Future<bool> addDriver(driver entity) async {
    return data.addDriver(entity);
  }

  Future<List<driver>> getdrivers() async {
    List<driver> drivers = await data!.getDrivers();
    return drivers;
  }

  Future<driver> getdriver(String email) async {
    driver _driver = await data!.getdriver(email);
    return _driver;
  }

  Future<String> checkDriver(String email) async {
    return data!.checkDriver(email);
  }
}

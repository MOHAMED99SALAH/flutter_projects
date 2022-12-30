import 'package:delicyfood/data/models/soldProduct.dart';
import 'package:delicyfood/presentation/screens/all_pages/getstart.dart';

import '../models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class data_api {
  Future<List<product>> getDataVege() async {
    http.Response response = await http.Client()
        .get(Uri.parse("http://localhost:8080/delicyfood/getVegetables"));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<product> products = [];
      for (var item in jsonData) {
        products.add(product.fromJson(item));
      }
      return products;
    }
  }

  Future<List<product>> getDataFruits() async {
    http.Response response = await http.Client()
        .get(Uri.parse("http://localhost:8080/delicyfood/getFruits"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<product> products = [];
      for (var item in jsonData) {
        products.add(product.fromJson(item));
      }
      return products;
    }
    return null;
  }

  Future<List<soldProduct>> getLastOrder() async {
    http.Response response = await http.Client().get(Uri.parse(
        "http://localhost:8080/delicyfood/lastOrder/${getstart.name_user}"));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<soldProduct> LastOrder = [];
      for (var item in jsonData) {
        LastOrder.add(soldProduct.fromJson(item));
      }
      return LastOrder;
    }
    return null;
  }

  Future<bool> addorder(List<product> products ,int total_price,String location) async {
    var url = "http://localhost:8080/delicyfood/addOrder";

    var data = {
      "email": getstart.name_user,
      "location":location,
      "totalPrice":total_price,
      "order_details": [for (var p in products) p.toJson()]
    };
    var response = await http.post(Uri.parse(url), body: data);
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> addProduct(product product) async {
    var url = "http://localhost:8080/delicyfood/addProduct";

    var data = {
      "name": product.name,
      "price": product.price,
      "quantity": product.quantity,
      "imagePath": product.imagePath,
      "cat_id": product.catgID,
    };
    var response = await http.post(Uri.parse(url), body: data);
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> updateProduct(product product) async {
    var url = "http://localhost:8080/delicyfood/updateProduct";

    var data = {
      "productID": product.id,
      "name": product.name,
      "price": product.price,
      "quantity": product.quantity,
      "imagePath": product.imagePath,
      "cat_id": product.catgID,
    };
    var response = await http.put(Uri.parse(url), body: data);
    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }

  Future<bool> deleteProduct(int id) async {
    var url = "http://localhost:8080/delicyfood/deleteProduct/${id}";

    var response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      return true;
    }

    return false;
  }
}

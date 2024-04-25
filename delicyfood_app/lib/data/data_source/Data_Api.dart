import 'package:delicyfood/presentation/screens/all_pages/getstart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../models/Order.dart';
import '../models/add_product.dart';
import '../models/driver.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Data_api {
  Future<List<Product>> getDataVege() async {
    List<Product> products = [];
    var url = "http://192.168.100.8:8080/delicyfood/getVegetables";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };
    http.Response response =
        await http.Client().get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      print(response.statusCode);
      var jsonData = json.decode(response.body);
      List<Product> products = [];
      for (var item in jsonData) {
        products.add(Product.fromJson(item));
      }
      return products;
    }
    return products;
  }

  Future<List<Product>> getDataFruits() async {
    List<Product> products = [];
    var url = "http://192.168.100.8:8080/delicyfood/getFruits";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };
    http.Response response =
        await http.Client().get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Product> products = [];
      for (var item in jsonData) {
        products.add(Product.fromJson(item));
      }
      return products;
    }
    return products;
  }

  Future<List<Order>> getOrders() async {
    final response = await http
        .get(Uri.parse('http://192.168.100.8:8080/delicyfood/getOrders'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Order> loadedOrders =
          jsonList.map((item) => Order.fromJson(item)).toList();
      return loadedOrders;
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<List<Order>> get_last_Orders() async {
    final response = await http.get(Uri.parse(
        'http://192.168.100.8:8080/delicyfood/lastOrders/${Getstart.name_user}'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Order> loadedOrders =
          jsonList.map((item) => Order.fromJson(item)).toList();
      return loadedOrders;
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<bool> addorder(List<Product> products, int total_price, String address,
      String phone) async {
    var url = "http://192.168.100.8:8080/delicyfood/addOrder";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String? Token = await FirebaseMessaging.instance.getToken();

    final Map<String, dynamic> data = {
      "email": user!.email,
      "location": {
        "address": address,
      },
      "userPhone": phone,
      "totalPrice": total_price,
      "device_token": Token,
      "order_details": [
        for (var p in products)
          {
            "product": {"productID": p.id},
            "quantity": p.quantity
          }
      ]
    };

    http.Response response = await http.Client()
        .post(Uri.parse(url), headers: headers, body: json.encode(data));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> addProduct(Added_product product) async {
    var url = "http://192.168.100.8:8080/delicyfood/addProduct";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };

    final Map<String, dynamic> model = {
      "name": product.name,
      "price": product.price,
      "quantity": product.quantity,
      "imagePath": product.imagePath,
      "cat_id": product.catgID
    };

    http.Response response = await http.Client()
        .post(Uri.parse(url), headers: headers, body: json.encode(model));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateProduct(Product product) async {
    var url = "http://192.168.100.8:8080/delicyfood/updateProduct";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };

    final Map<String, dynamic> model = {
      "productID": product.id,
      "name": product.name,
      "price": product.price,
      "quantity": product.quantity,
      "imagePath": product.imagePath,
      "cat_id": product.catgID
    };
    var response = await http.Client()
        .put(Uri.parse(url), headers: headers, body: json.encode(model));
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> deleteProduct(int id) async {
    var url = "http://192.168.100.8:8080/delicyfood/deleteProduct/${id}";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };
    var response = await http.delete(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updateDriverOforder(int id, driver entity) async {
    var url = "http://192.168.100.8:8080/delicyfood/updateDriverID/${id}";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };

    final Map<String, dynamic> model = {
      "id": entity.ID,
    };

    var response = await http.put(Uri.parse(url),
        headers: headers, body: json.encode(model));

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updateMarketStatus(int id) async {
    var url =
        "http://192.168.100.8:8080/delicyfood/updateOrderStatusOfmarket/${id}";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };
    var response = await http.put(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updateDriverStatusOforder(int id) async {
    var url =
        "http://192.168.100.8:8080/delicyfood/updateOrderStatusOfdriver/${id}";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };
    var response = await http.put(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> updateDriverStatus(String? email, bool status) async {
    var url =
        "http://192.168.100.8:8080/delicyfood/updateDriverStatus/${email}/${status}";

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };
    var response = await http.put(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  Future<bool> addDriver(driver entity) async {
    var url = "http://192.168.100.8:8080/delicyfood/addDriver";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };

    final Map<String, dynamic> model = {
      "email": entity.email,
      "phone": entity.phone,
      "status": false,
    };
    http.Response response = await http.Client()
        .post(Uri.parse(url), headers: headers, body: json.encode(model));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<driver> getdriver(String email) async {
    driver? _driver = new driver(ID: 0, email: "", phone: "");

    var url = "http://192.168.100.8:8080/delicyfood/getDriver/${email}";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };

    http.Response response =
        await http.Client().get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      _driver = driver.fromJson(jsonData);
      return _driver;
    }
    return _driver;
  }

  Future<String> checkDriver(String email) async {
    String? value;

    var url = "http://192.168.100.8:8080/delicyfood/checkDriver/${email}";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };

    http.Response response =
        await http.Client().get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      value = response.body;

      return value!;
    }
    return "error";
  }

  Future<List<driver>> getDrivers() async {
    List<driver> drivers = [];
    var url = "http://192.168.100.8:8080/delicyfood/getDrivers";
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer yourAccessToken',
    };
    http.Response response =
        await http.Client().get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var item in jsonData) {
        drivers.add(driver.fromJson(item));
      }
      return drivers;
    }
    return drivers;
  }

  Future<List<Order>> getOrdersOfDriver(String? email) async {
    final response = await http.get(Uri.parse(
        'http://192.168.100.8:8080/delicyfood/OrdersbyDriver/${email}'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      List<Order> loadedOrders =
          jsonList.map((item) => Order.fromJson(item)).toList();
      return loadedOrders;
    } else {
      throw Exception('Failed to load orders');
    }
  }
}

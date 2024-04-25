import 'package:flutter/material.dart';

import 'driver.dart';
import 'location.dart';
import 'order_details.dart';

class Order {
  final int orderID;
  final double totalPrice;
  final String date;
  final String phone;
  final List<OrderDetail> orderDetails;
  final location locationOforder;
  final driver? Driver;
  final String email;
  final bool status_of_market;
  final bool status_of_deriver;
  Order(
      {required this.orderID,
      required this.totalPrice,
      required this.date,
      required this.phone,
      required this.orderDetails,
      required this.locationOforder,
      required this.Driver,
      required this.email,
      required this.status_of_market,
      required this.status_of_deriver});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      orderID: json['orderID'],
      totalPrice: json['totalPrice'].toDouble(),
      date: json['date'],
      phone: json['userPhone'],
      status_of_market: json['status_of_market'],
      status_of_deriver: json['status_of_deriver'],
      orderDetails: (json['order_details'] as List<dynamic>)
          .map((detail) => OrderDetail.fromJson(detail))
          .toList(),
      locationOforder: location.fromJson(json['location']),
      Driver: json['driver'] != null ? driver.fromJson(json['driver']) : null,
      email: json['email'],
    );
  }


}




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class userr {
  String email;
  String password;
  String phone;

  userr({required this.email, required this.password, required this.phone});

  void uploadDataUser(BuildContext context) async {
    FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
    String collectionName = "Users";

    var uniquekey = _firebaseFirestore.collection(collectionName).doc();

    try {
      _firebaseFirestore.collection(collectionName).doc(uniquekey.id).set({
        "email": this.email,
        "Phone": this.phone,
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          e.toString(),
        ),
        backgroundColor: Colors.blueGrey,
      ));
    }
  }
}

import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/data/repository/repository.dart';
import 'package:delicyfood/presentation/screens/all_pages/location.dart';
import 'package:delicyfood/business/bloc/centralProvider.dart';
import 'package:delicyfood/presentation/screens/all_pages/getstart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtomExcute extends StatelessWidget {
  List<Product> soldProducts;

  Products_repository repo;

  ButtomExcute(this.soldProducts);

  @override
  Widget build(BuildContext context) {
    double ReallyWidth = MediaQuery.of(context).size.width;
    var cost = Provider.of<TotalPrice>(context, listen: false);
    // TODO: implement build
    return Center(
      child: Container(
        height: 60,
        width: ReallyWidth - 100,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          onPressed: () {
            if (cost.num != 0) {
              if (cost.num > 15) {
                if (MapScreen.status == false ) {
                  SnackBar snackBar = SnackBar(
                    content: Text("Please Select Your Location"),
                    backgroundColor: Colors.blueGrey,
                    duration: Duration(milliseconds: 2000),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                } else {
                  String location_of_user =
                      "Longitude : ${MapScreen.Mylocation.longitude} // Latitude : ${MapScreen.Mylocation.latitude}";
                  Future<bool> status =
                      repo.addOrder(soldProducts,cost.num.toInt(),location_of_user);

                  if (status == true) {
                    SnackBar snackBar = SnackBar(
                      content: Text(
                        "Your order will arrive in 15 minutes " +
                            "  TO " +
                            Getstart.name_user,
                        style: TextStyle(color: Colors.white),
                      ),
                      duration: Duration(milliseconds: 2500),
                      backgroundColor: Colors.blueGrey,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    SnackBar snackBar = SnackBar(
                      content: Text(
                        "some thing went wrong",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Color.fromARGB(255, 177, 44, 44),
                      duration: Duration(milliseconds: 400),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                }
              } else {
                SnackBar snackBar = SnackBar(
                  content: Text("Please reach To Minimum Order Price"),
                  duration: Duration(milliseconds: 2500),
                  backgroundColor: Colors.blueGrey,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            } else {
              SnackBar snackBar = SnackBar(
                content: Text("no items in cart"),
                backgroundColor: Colors.blueGrey,
                duration: Duration(milliseconds: 2000),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          color: Colors.teal,
          child: Text(
            " Buy Now",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

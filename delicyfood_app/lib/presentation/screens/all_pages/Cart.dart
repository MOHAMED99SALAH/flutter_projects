import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:delicyfood/business/bloc/bloc.dart';
import 'package:delicyfood/business/bloc/centralProvider.dart';
import 'package:delicyfood/data/models/product.dart';
import 'package:delicyfood/presentation/screens/all_pages/hasNo_Internet.dart';
import 'package:delicyfood/presentation/screens/all_pages/location.dart';
import 'package:delicyfood/presentation/widgets/cart/TotalCustom.dart';
import 'package:delicyfood/presentation/widgets/cart/buttomExcute.dart';
import 'package:delicyfood/presentation/widgets/cart/notification.dart';
import 'package:delicyfood/presentation/widgets/cart/soldItems.dart';
import 'package:delicyfood/presentation/widgets/cart/voucher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  final CartBloc bloc = BlocProvider.getBloc<CartBloc>();
  List<product> fooditems = [];

  Widget page() {
    return StreamBuilder(
        stream: bloc.ListStream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            fooditems = (snapshot.data) as List<product>;

            return ChangeNotifierProvider(
              create: (_) => TotalPrice(returntatal(fooditems)),
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.teal[700],
                        size: 25,
                      )),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return GlobalSreen();
                        }));
                      },
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          textStyle: TextStyle(fontWeight: FontWeight.w600)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.teal,
                          ),
                          Text(
                            "Location",
                            style: TextStyle(color: Colors.teal[700]),
                          )
                        ],
                      ),
                    ),
                  ],
                  title: Text(
                    "Orders",
                    style: TextStyle(color: Colors.teal[700]),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                ),
                body: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(right: 6, left: 6),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),

                        notification(),

                        SizedBox(
                          height: 15,
                        ),

                        //  for(var pro in fooditems )

                        // Shape2(pro),

                        Listproducts_sold(fooditems),

                        Container(
                          height: 2,
                          color: Colors.grey[400],
                        ),
                        SizedBox(
                          height: 16,
                        ),

                        voucher(),

                        SizedBox(
                          height: 16,
                        ),
                        TotalCustom(),

                        SizedBox(
                          height: 15,
                        ),

                        ButtomExcute(fooditems),

                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return page();
        } else {
          return noInternet();
        }
      },
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.teal[700],
      )),
    );
  }
}

double returntatal(List<product> fooditems) {
  double totalprice = 0;
  for (int i = 0; i < fooditems.length; i++) {
    totalprice = totalprice + (fooditems[i].price * fooditems[i].quantity);
  }
  return totalprice;
}

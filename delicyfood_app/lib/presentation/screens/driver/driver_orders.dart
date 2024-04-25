import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:delicyfood/data/data_source/Data_Api.dart';
import 'package:delicyfood/data/models/Order.dart';
import 'package:delicyfood/data/repository/repository.dart';
import '../../../data/models/driver.dart';
import '../../widgets/global_widgets/sideBar2.dart';
import '../../widgets/lastOrders/shapeOForder.dart';
import '../../widgets/shop/order_Shape.dart';
import 'driver_order_Shape.dart';

class driver_Orders extends StatefulWidget {
  static String? email;
  static int? driver_id;
  @override
  State<driver_Orders> createState() => driver_OrdersState();
}

class driver_OrdersState extends State<driver_Orders> {
  Data_api? _data_api;
  Products_repository? repo;
  late Future<List<Order>> _ordersFuture; // Future for fetching orders

  @override
  void initState() {
    super.initState();
    _data_api = Data_api();
    repo = Products_repository(_data_api!);

    _ordersFuture =
        _fetchOrders(); // Fetch orders when the widget is initialized
  }

  // Method to fetch orders from the API
  Future<List<Order>> _fetchOrders() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    return repo!.getOrdersbyDriver(user!.email);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        drawer: Sidebar2(),
        appBar: AppBar(
          title: Text(
            "Orders",
            style: TextStyle(color: Colors.teal[700]),
          ),
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(
                  Icons.view_headline,
                  color: Colors.teal[700],
                  size: 25,
                ));
          }),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _ordersFuture = _fetchOrders();
            });
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 20),
                FutureBuilder<List<Order>>(
                  future: _ordersFuture,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Order>> snapshot) {
                    if (snapshot.data == null) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 300,
                          ),
                          Center(
                            child: LoadingAnimationWidget.inkDrop(
                              color: Colors.teal[700]!,
                              size: 45,
                            ),
                          ),
                        ],
                      );
                    }
                    if (snapshot.data!.length != 0) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return driver_Order_shape(snapshot.data![index]);
                        },
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            height: 100,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Lottie.asset(
                                "images/no -data .json",
                                fit: BoxFit.fill,
                              ),
                              height: 450,
                              width: 400,
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

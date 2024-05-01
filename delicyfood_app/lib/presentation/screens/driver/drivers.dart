import 'package:delicyfood/presentation/screens/driver/driverShape.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:delicyfood/data/data_source/Data_Api.dart';
import 'package:delicyfood/data/repository/repository.dart';
import '../../../data/models/driver.dart';

class drivers extends StatefulWidget {
  int order_id;

  drivers(this.order_id);

  @override
  State<drivers> createState() => _driversState();
}

class _driversState extends State<drivers> {
  Data_api? _data_api;
  Products_repository? repo;
  late Future<List<driver>> _driversFuture; // Future for fetching orders

  @override
  void initState() {
    super.initState();
    _data_api = Data_api();
    repo = Products_repository(_data_api!);
    _driversFuture =
        _fetchDrivers(); // Fetch orders when the widget is initialized
  }

  // Method to fetch orders from the API
  Future<List<driver>> _fetchDrivers() async {
    return repo!.getdrivers();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(
            "drivers",
            style: TextStyle(color: Colors.teal[700]),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.teal[700],
              size: 25,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _driversFuture = _fetchDrivers();
            });
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 20),
                FutureBuilder<List<driver>>(
                  future: _driversFuture,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<driver>> snapshot) {
                    if (!snapshot.hasData) {
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
                          return driverShape(
                              snapshot.data![index], widget.order_id);
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

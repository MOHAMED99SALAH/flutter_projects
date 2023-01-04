import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/data/dataSource/data_api.dart';
import 'package:weather/presentation/screens/hasNo_Internet.dart';
import '../../business/cubit/weather_cubit.dart';
import '../../data/models/weather_module.dart';
import '../../data/repository/weatherRepo.dart';

import 'package:sizer/sizer.dart';

class Show_Weather extends StatefulWidget {
  String city;

  Show_Weather(this.city);

  @override
  State<Show_Weather> createState() => _Show_WeatherState();
}

class _Show_WeatherState extends State<Show_Weather> {
  @override
  void initState() {
    super.initState();

    //  BlocProvider.of<WeatherCubit>(context).getTempereture(widget.city);
  }

  Widget page(DateTime dateTime, BuildContext context) {
    return BlocProvider(
        create: (context) =>
            WeatherCubit(WeatherRepo(Weather_API()))..getTemp(widget.city),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.blueGrey,
            title: Text(
              "Temperatures Now ",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp),
            ),
          ),
          backgroundColor: Colors.blueGrey,
          body: SafeArea(
            child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
              if (state is WeatherInitial) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                );
              } else if (state is WeatherLoaded) {
                Weather_module model = (state).model;
                //FutureBuilder(
                //  future:data.getweather(widget.city) ,
                //    builder: (context, snapdata) {
                // if (snapdata.hasData) {
                //   model = snapdata.data;

                return ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    SizedBox(
                      height: 2.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 3.h,
                        ),
                        Center(
                          child: Hero(
                            tag: "logo",
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4.w)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/explorer-optimize.gif"),
                                    fit: BoxFit.cover,
                                  )),
                              height: 33.h,
                              width: 86.w,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "   Last updated ",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              "${dateTime}   ",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: .2.h,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          widget.city,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23.sp),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          model.getTemp.round().toString() + " c",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 25.sp),
                        ),
                        Text(
                          "Temperature",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 8.sp),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, right: 4.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text(
                                    model.getTempMin.round().toString() + " c",
                                    style: TextStyle(
                                        fontSize: 25.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "Minimum temperature",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 8.sp),
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  Text(
                                    model.getTempMax.round().toString() + " c",
                                    style: TextStyle(
                                        fontSize: 25.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900),
                                  ),
                                  Text(
                                    "maximal temperature",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 8.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              } else if (state is WeatherNotFound) {
                return Container(
                  child: Lottie.network(
                      "https://assets4.lottiefiles.com/packages/lf20_agnejizn.json",
                      fit: BoxFit.contain),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                );
              }
            }),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();

    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return page(dateTime, context);
        } else {
          return NoInternet();
        }
      },
      child: Center(
          child: CircularProgressIndicator(
        color: Colors.teal[700],
      )),
    );
  }
}

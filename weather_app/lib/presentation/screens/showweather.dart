import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/data/dataSource/data_api.dart';

import 'package:weather/presentation/screens/hasNo_Internet.dart';
import '../../business/cubit/weather_cubit.dart';
import '../../data/models/weather_item.dart';
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
  String getWeatherAnimation(String description) {
    if (description == null) return 'assets/sunny.json';
    switch (description.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloud.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rainy.json';
      case 'thunderstorm':
        return 'assets/mist.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/cloud.json';
    }
  }

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
              "Weather Now ",
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
                        Text(
                          widget.city,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Lottie.asset(getWeatherAnimation(model.getDescription)),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          model.getTemp.round().toString() + " °c",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 50.sp),
                        ),
                        Text(
                          model.getDescription,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WeatherItem(
                                value: model.getwidspeed,
                                unit: 'km/h',
                                imageUrl: 'assets/windspeed.png',
                              ),
                              WeatherItem(
                                value: model.humidity,
                                unit: '%',
                                imageUrl: 'assets/humidity.png',
                              ),
                              WeatherItem(
                                value: model.clouds,
                                unit: '%',
                                imageUrl: 'assets/cloud.png',
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
              } else {
                return Container();
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

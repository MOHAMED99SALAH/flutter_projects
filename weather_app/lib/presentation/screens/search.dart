import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:weather/business/cubit/weather_cubit.dart';
import 'package:weather/data/dataSource/data_api.dart';
import 'package:weather/data/repository/weatherRepo.dart';
import 'package:weather/presentation/screens/hasNo_Internet.dart';
import 'package:weather/presentation/screens/showweather.dart';
import 'package:sizer/sizer.dart';

class Searchpage extends StatelessWidget {
  Widget page(TextEditingController editor, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          "Check temperatures",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp),
        ),
      ),
      backgroundColor: Colors.blueGrey,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(left: 9.w, right: 9.w),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
              SizedBox(
                height: 10.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Search Weather ",
                    style: TextStyle(
                        fontSize: 29.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
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
                              image: AssetImage("assets/explorer-optimize.gif"),
                              fit: BoxFit.cover,
                            )),
                        height: 33.h,
                        width: 86.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  TextFormField(
                    controller: editor,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white70,
                        size: 6.w,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          borderSide: BorderSide(
                              color: Colors.white70, style: BorderStyle.solid)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.w)),
                          borderSide: BorderSide(
                              color: Colors.white70, style: BorderStyle.solid)),
                      hintText: "City Name",
                      hintStyle:
                          TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(height: 6.h),
                  Container(
                    width: 80.w,
                    height: 7.h,
                    child: MaterialButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3.w))),
                      onPressed: () {
                        if (editor.text == "") {
                          showSimpleNotification(
                              Text(
                                "Enter City Name",
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              background: Colors.white);
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Show_Weather(editor.text.toLowerCase());
                          }));
                        }
                      },
                      color: Colors.white,
                      child: Text(
                        " Search  ",
                        style:
                            TextStyle(color: Colors.blueGrey, fontSize: 16.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    WeatherRepo repo = WeatherRepo(Weather_API());
    WeatherCubit weatherCubit = WeatherCubit(repo);

    TextEditingController editor = TextEditingController();

    // TODO: implement build
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;

        if (connected) {
          return page(editor, context);
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

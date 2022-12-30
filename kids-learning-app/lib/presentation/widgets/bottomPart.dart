import 'package:flutter/material.dart';
import 'package:kids/presentation/screens/help.dart';
import 'package:kids/presentation/screens/login.dart';
import 'package:kids/presentation/screens/getstart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../screens/HomeScreen.dart';

class bottomPart extends StatefulWidget {
  const bottomPart({Key key}) : super(key: key);

  @override
  State<bottomPart> createState() => _bottomPartState();
}

class _bottomPartState extends State<bottomPart> {
  _saveData(String name, String username, String phone, bool state) async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    shared_data.setString("NAME", name);
    shared_data.setString("USERNAME", username);
    shared_data.setString("PHONE", phone);
    shared_data.setBool("STATE", state);
  }

  _help(bool help) async {
    SharedPreferences help_data = await SharedPreferences.getInstance();
    help_data.setBool("HELP", help);
  }

  NeedHelp() async {
    SharedPreferences help_data = await SharedPreferences.getInstance();
    setState(() {
      if (help_data.getBool("HELP") == false) {
        getstart.help = help_data.getBool("HELP");
      } else {
        getstart.help = true;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NeedHelp();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Discover The World With Us .',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 7.h),
            Text(
              'we have many features to help you to learn and know details about things . '
              'so get started now with us . ',
              style: TextStyle(
                fontSize: 10.sp,
                color: Colors.white.withOpacity(0.8),
                height: .2.h,
              ),
            ),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: () async {
                //_saveData("", "", "", false);
               // _help(false);

                if (getstart.help == false) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return help();
                  }));
                } else {
                  if (getstart.state == false) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return home();
                    }));
                  }
                }
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 12.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: .5.w),
                  ),
                  child: Icon(
                    Icons.chevron_right,
                    size: 20.w,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}

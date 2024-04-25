import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:sizer/sizer.dart';
import 'package:weather/presentation/screens/search.dart';

void main() {
  runApp(weather());
}

class weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return OverlaySupport.global(
          child: MaterialApp(
              debugShowCheckedModeBanner: false, home: Searchpage()));
    });
  }
}

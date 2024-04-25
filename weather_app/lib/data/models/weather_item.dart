import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class WeatherItem extends StatelessWidget {
  final dynamic value;
  final String unit;
  final String imageUrl;

  const WeatherItem({
    Key? key,
    required this.value,
    required this.unit,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.w,
      height: 15.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(.1.h),
            height: 11.h,
            width: 11.w,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10.h),
            ),
            child: Image.asset(imageUrl),
          ),
          Text(
            value.toString() + unit,
            style: TextStyle(
              fontSize: 12.sp,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        ],
      ),
    );
  }
}

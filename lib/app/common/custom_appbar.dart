import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      height: 100.h,
      width: width,
      decoration: BoxDecoration(
        color: kOffWhite,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(top: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22.r,
                  backgroundColor: kSecondary,
                  backgroundImage:
                      NetworkImage('https://i.imgur.com/t0LyKKs.jpeg'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: 'Deliver to',
                        style: appStyle(13, kSecondary, FontWeight.w600),
                      ),
                      SizedBox(
                        width: width * 0.65,
                        child: Text(
                          'Perumahan Griya Alifa, Jl.Sukabirus No.4',
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(
                              11,
                              const Color.fromARGB(255, 202, 186, 158),
                              FontWeight.normal),
                        ),
                      ),
                      Container(
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              getTimeOfDay(),
              style: TextStyle(fontSize: 30, color: kSecondary),
            ),
          ],
        ),
      ),
    );
  }
}

String getTimeOfDay() {
  DateTime now = DateTime.now();
  int hour = now.hour;

  if (hour >= 0 && hour < 12) {
    return ' 🔅 ';
  } else if (hour >= 12 && hour < 16) {
    return ' ⛅ ';
  } else {
    return ' 🌙 ';
  }
}

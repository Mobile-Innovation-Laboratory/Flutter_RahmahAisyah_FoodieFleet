import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:get/get.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
          backgroundColor: kOffWhite,
          elevation: 0,
          title: Center(
            child: ReusableText(
                text: 'Profile', style: appStyle(18, kDark, FontWeight.w500)),
          )),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(Routes.login);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimary,
            foregroundColor: kOffWhite,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 24.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            'Register',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

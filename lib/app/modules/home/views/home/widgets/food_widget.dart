import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';

class FoodWidget extends StatelessWidget {
  const FoodWidget(
      {super.key,
      required this.image,
      required this.title,
      required this.time,
      required this.price,
      this.onTap});

  final String image;
  final String title;
  final String time;
  final String price;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          width: width * .60,
          height: 180.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: kLightWhite,
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: SizedBox(
                  height: 120.h,
                  width: width,
                  child: Image.network(image),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: title,
                          style: appStyle(12, kDark, FontWeight.w500),
                        ),
                        ReusableText(
                          text: '\$ $price',
                          style: appStyle(12, kPrimary, FontWeight.w600),
                        ),
                      ],
                    ),
                    Container(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                            text: 'Delivery time',
                            style: appStyle(9, kGray, FontWeight.w500)),
                        ReusableText(
                            text: time,
                            style: appStyle(9, kDark, FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

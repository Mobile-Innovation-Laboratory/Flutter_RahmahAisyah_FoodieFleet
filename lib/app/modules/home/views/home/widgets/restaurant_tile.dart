import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({super.key, required this.restaurant});

  final dynamic restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 80.h,
            width: width,
            decoration: BoxDecoration(
              color: kOffWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.network(
                            restaurant['imageUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                            // ignore: deprecated_member_use
                            color: kGray.withOpacity(0.6),
                            height: 16.h,
                            width: width,
                            child: RatingBarIndicator(
                              rating: 5,
                              itemCount: 5,
                              itemBuilder: (context, i) => Icon(
                                Icons.star,
                                color: kSecondary,
                              ),
                              itemSize: 15.h,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: restaurant['title'],
                        style: appStyle(13, kDark, FontWeight.w500),
                      ),
                      ReusableText(
                        text: "Delivery time: ${restaurant['time']}",
                        style: appStyle(12, kGray, FontWeight.w400),
                      ),
                      Flexible(
                        child: Text(
                          restaurant['coords']['address'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: appStyle(9, kGray, FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 44.w,
              height: 23.h,
              decoration: BoxDecoration(
                color: restaurant['isAvailable'] == true ||
                        restaurant['isAvailable'] != null
                    ? kPrimary
                    : kSecondaryLight,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableText(
                  text: restaurant['isAvailable'] == true ||
                          restaurant['isAvailable'] != null
                      ? 'Open'
                      : 'Closed',
                  style: appStyle(12, kLightWhite, FontWeight.w600),
                ),
              ),
            ),
          ),
          Positioned(
            right: 60.w,
            top: 6.h,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 19.w,
                height: 19.h,
                decoration: BoxDecoration(
                  color: restaurant['isAvailable'] == true ||
                          restaurant['isAvailable'] != null
                      ? kSecondary
                      : kSecondaryLight,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                    child: Icon(
                  MaterialCommunityIcons.cart_plus,
                  size: 15.h,
                  color: kLightWhite,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

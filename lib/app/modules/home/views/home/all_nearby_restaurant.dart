import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/background_container.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/constants/uidata.dart';
import 'package:foodie_fleet_app/app/modules/home/views/home/widgets/restaurant_tile.dart';

class AllNearbyRestaurant extends StatelessWidget {
  const AllNearbyRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
          backgroundColor: kOffWhite,
          elevation: 0,
          title: ReusableText(
              text: 'Nearby Restaurant',
              style: appStyle(18, kDark, FontWeight.w500))),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            children: List.generate(restaurants.length, (i) {
              var restaurant = restaurants[i];
              return RestaurantTile(
                restaurant: restaurant,
              );
            }),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_fleet_app/app/common/custom_appbar.dart';
import 'package:foodie_fleet_app/app/common/custom_container.dart';
import 'package:foodie_fleet_app/app/common/heading.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/modules/home/views/home/all_fastest_food.dart';
import 'package:foodie_fleet_app/app/modules/home/views/home/all_nearby_restaurant.dart';
import 'package:foodie_fleet_app/app/modules/home/views/home/recomendation_page.dart';
import 'package:foodie_fleet_app/app/modules/home/views/home/widgets/category_list.dart';
import 'package:foodie_fleet_app/app/modules/home/views/home/widgets/food_list.dart';
import 'package:foodie_fleet_app/app/modules/home/views/home/widgets/nearby_restaurants_list.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const CustomAppbar(),
      ),
      body: SafeArea(
        child: CustomContainer(
            containerContent: Column(
          children: [
            const CategoryList(),
            Container(height: 15),
            Heading(
              teks: 'Nearby Restaurant',
              onTap: () {
                Get.to(() => AllNearbyRestaurant(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900));
              },
            ),
            NearbyRestaurantsList(),
            Container(height: 10),
            Heading(
              teks: 'Try Something New',
              onTap: () {
                Get.to(() => Recomendation(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900));
              },
            ),
            FoodList(),
            Container(height: 10),
            Heading(
              teks: 'Fastest Food Closer to You',
              onTap: () {
                Get.to(() => AllFastestFood(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900));
              },
            ),
            FoodList(),
          ],
        )),
      ),
    );
  }
}

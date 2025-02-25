import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/modules/home/views/categories/category_page.dart';
import 'package:get/get.dart';

class CategoryTile  extends StatelessWidget {
  CategoryTile({
    super.key,
    required this.category,
  });

  dynamic category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(() => const CategoryPage(),
            transition: Transition.fadeIn,
            duration: const Duration(microseconds: 900));
      },
      leading: CircleAvatar(
        radius: 24.r,
        backgroundColor: kGrayLight,
        child: Image.network(
          category['imageUrl'],
          fit: BoxFit.contain,
        ),
      ),
      title: ReusableText(
        text: category['title'],
        style: appStyle(14, kGray, FontWeight.normal),
      ),
      trailing: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}

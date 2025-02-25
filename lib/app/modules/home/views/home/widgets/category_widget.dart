import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/modules/home/controllers/categort_controller.dart';
import 'package:foodie_fleet_app/app/modules/home/views/categories/all_categories.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category['_id']) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category['value'] == 'more') {
          Get.to(() => AllCategories(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 900));
        } else {
          controller.updateCategory = category['_id'];
          controller.updateTitle = category['title'];
          Get.back();
        }
      },
      child: Obx(() => Container(
            margin: EdgeInsets.only(right: 5.w),
            padding: EdgeInsets.only(top: 4.h),
            width: width * 0.19,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(10.r),
              border: Border.all(
                  color: controller.categoryValue == category['_id']
                      ? kSecondary
                      : kSecondaryLight,
                  width: 1.w),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                  child:
                      Image.network(category['imageUrl'], fit: BoxFit.contain),
                ),
                ReusableText(
                    text: category['title'],
                    style: appStyle(12, kDark, FontWeight.normal))
              ],
            ),
          )),
    );
  }
}

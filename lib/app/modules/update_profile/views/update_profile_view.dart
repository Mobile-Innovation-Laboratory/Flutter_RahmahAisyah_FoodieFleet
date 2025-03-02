import 'package:flutter/material.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/background_container.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';

import 'package:get/get.dart';

import '../controllers/update_profile_controller.dart';

class UpdateProfileView extends GetView<UpdateProfileController> {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> user = Get.arguments;

    controller.addressC.text = user["address"] ?? "";
    controller.nameC.text = user["name"];
    controller.emailC.text = user["email"];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
            text: "Update Profile ",
            style: appStyle(22, kDark, FontWeight.w500)),
      ),
      body: BackgroundContainer(
        color: kOffWhite,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              readOnly: true,
              autocorrect: false,
              controller: controller.emailC,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              autocorrect: false,
              controller: controller.nameC,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: controller.addressC,
              decoration: InputDecoration(
                labelText: "Enter Address",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Obx(
              () => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimary,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  if (controller.isLoading.isFalse) {
                    await controller.updateProfile(user["uid"]);
                  }
                },
                child: Text(
                  controller.isLoading.isFalse
                      ? "Update Profile"
                      : "LOADING...",
                  style: TextStyle(
                      fontSize: 22, // Ukuran teks
                      fontWeight: FontWeight.bold, // Ketebalan teks
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

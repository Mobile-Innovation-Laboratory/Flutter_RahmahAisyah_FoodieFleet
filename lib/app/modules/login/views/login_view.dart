import 'package:flutter/material.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kOffWhite,
        title: Center(
          child: ReusableText(
              text: "Login ", style: appStyle(22, kDark, FontWeight.w500)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.emailC,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.passC,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Obx(
            () => ElevatedButton(
              onPressed: () async {
                if (controller.isLoading.isFalse) {
                  await controller.login();
                }
              },
              child:
                  Text(controller.isLoading.isFalse ? "Login" : "LOADING..."),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.register); // Navigasi ke halaman login
              },
              child: Text(
                "Don't have an account? Sign up here",
                style: appStyle(13, const Color(0xFF007BFF), FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

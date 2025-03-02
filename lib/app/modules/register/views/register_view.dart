import 'package:flutter/material.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: kOffWhite,
        title: Center(
          child: ReusableText(
              text: "Register ", style: appStyle(22, kDark, FontWeight.w500)),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.nameC,
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller.emailC,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            obscureText: true,
            controller: controller.passwordC,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              controller.register();
            },
            child: Text("Register"),
          ),
          SizedBox(height: 5),
          Center(
            child: TextButton(
              onPressed: () {
                Get.toNamed(Routes.login); // Navigasi ke halaman login
              },
              child: Text(
                "Have an account? Sign in here",
                style: appStyle(13, const Color(0xFF007BFF), FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

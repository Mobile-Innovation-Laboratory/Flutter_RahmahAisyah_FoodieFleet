import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/background_container.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

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
        backgroundColor: kPrimary,
        title: Center(
          child: Image.asset(
            "assets/images/logo.png",
            height: 40, // Sesuaikan ukuran jika perlu
          ),
        ),
      ),
      body: BackgroundContainer(
        color: kOffWhite,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(height: 30.h),
              Lottie.asset("assets/anime/delivery.json", height: 200.h),
              SizedBox(height: 20.h),
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
                () => SizedBox(
                  width: 500,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimary, 
                      padding: EdgeInsets.symmetric(
                          vertical: 10), 
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), 
                      ),
                    ),
                    onPressed: () async {
                      if (controller.isLoading.isFalse) {
                        await controller.login();
                      }
                    },
                    child: Text(
                      controller.isLoading.isFalse ? "Login" : "LOADING...",
                      style: TextStyle(
                        fontSize: 22, // Ukuran teks
                        fontWeight: FontWeight.bold, // Ketebalan teks
                        color: Colors.white, // Warna teks
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.register); // Navigasi ke halaman login
                  },
                  child: Text(
                    "Don't have an account? Sign up here",
                    style:
                        appStyle(13, const Color(0xFF007BFF), FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

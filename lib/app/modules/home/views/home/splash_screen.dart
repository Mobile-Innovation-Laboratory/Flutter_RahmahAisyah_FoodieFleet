import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      bool isLoggedIn = box.read("isLoggedIn") ?? false;
      if (isLoggedIn) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF30b9b2),
      body: Center(
        child: Image.asset('assets/images/logo.png', width: 320),
      ),
    );
  }
}

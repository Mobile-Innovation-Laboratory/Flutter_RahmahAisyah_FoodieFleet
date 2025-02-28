import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(Routes.home);
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

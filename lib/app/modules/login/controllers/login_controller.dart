import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fleet_app/app/modules/home/controllers/tab_index_controller.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  final box = GetStorage();
  var isLoading = false.obs;
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    isLoggedIn.value = box.read("isLoggedIn") ?? false;
    super.onInit();
  }

  Future<void> login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailC.text,
          password: passC.text,
        );

        isLoggedIn.value = true;
        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified == true) {
            String uid = userCredential.user!.uid;
            box.write("isLoggedIn", true);
            box.write("userEmail", emailC.text);
            box.write("userUID", uid);

            Future.delayed(Duration(milliseconds: 100), () {
              final tabController = Get.find<TabIndexController>();
              tabController.setTabIndex = 3;
              tabController.checkLoginStatus();
              tabController.update();

              Get.offAllNamed(Routes.home);
            });
          } else {
            Get.defaultDialog(
              title: "Belum Verifikasi",
              middleText:
                  "Kamu belum verifikasi akun ini. Lakukan verifikasi di email kamu.",
            );
          }
        }
      } on FirebaseAuthException catch (e) {
        String errorMessage = "Terjadi kesalahan. Silakan coba lagi.";

        if (e.code == 'user-not-found') {
          errorMessage = "Email tidak terdaftar!";
        } else if (e.code == 'wrong-password') {
          errorMessage = "Password salah!";
        } else if (e.code == 'invalid-email') {
          errorMessage = "Format email tidak valid!";
        } else if (e.code == 'too-many-requests') {
          errorMessage = "Terlalu banyak percobaan login. Coba lagi nanti.";
        } else if (e.code == 'invalid-credential') {
          errorMessage = "Email atau password salah!";
        }

        Get.snackbar(
          "Login Gagal",
          errorMessage,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          duration: Duration(seconds: 3),
        );
      } catch (e) {
        Get.snackbar(
          "Error",
          "Terjadi kesalahan saat login: $e",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          icon: const Icon(Icons.error, color: Colors.white),
          duration: Duration(seconds: 3),
        );
      }
      isLoading.value = false;
    }
  }
}

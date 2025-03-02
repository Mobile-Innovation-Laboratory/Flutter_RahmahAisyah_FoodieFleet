import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:foodie_fleet_app/app/modules/home/controllers/tab_index_controller.dart';
import 'package:foodie_fleet_app/app/modules/home/views/profile/profile_page.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void checkLoginStatus() {
    if (auth.currentUser == null) {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Get.offAll(() => ProfilePage());
      });
    }
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() {
    String uid = auth.currentUser!.uid;

    return firestore.collection('user').doc(uid).snapshots();
  }

   void logout() async {
    try {
      await auth.signOut();
      box.erase(); // Hapus semua data tersimpan

      final tabController = Get.find<TabIndexController>();
      tabController.setTabIndex = 0; // Kembali ke tab Home setelah logout

      Get.offAllNamed(Routes.home);
    } catch (e) {
      Get.snackbar("Error", "Gagal logout: $e");
    }
  }

  Future<void> deleteUser() async {
    String uid = auth.currentUser!.uid;
    try {
      await firestore.collection('users').doc(uid).delete();
      await auth.currentUser!.delete();

      // Tampilkan snackbar sebelum navigasi
      Get.snackbar("Success", "Account deleted successfully!");

      // Gunakan Future.delayed agar navigasi terjadi setelah snackbar tampil
      Future.delayed(Duration(seconds: 1), () {
        Get.offAllNamed('/home');
      });
    } catch (e) {
      // Pastikan snackbar tidak dipanggil dalam build process
      Future.delayed(Duration.zero, () {
        Get.snackbar("Error", "Failed to delete account: $e");
      });
    }
  }
}

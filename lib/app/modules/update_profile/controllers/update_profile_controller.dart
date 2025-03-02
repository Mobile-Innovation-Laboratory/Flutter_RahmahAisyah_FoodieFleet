import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as s;
import 'package:firebase_auth/firebase_auth.dart';

class UpdateProfileController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController addressC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  s.FirebaseStorage storage = s.FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  final ImagePicker picker = ImagePicker();

  XFile? image;

  Future<void> updateProfile(String uid) async {
    if (nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        Map<String, dynamic> data = {
          "name": nameC.text,
          "email": emailC.text,
        };

        if (addressC.text.isNotEmpty) {
          data["address"] = addressC.text;
        }

        await firestore.collection("user").doc(uid).update({
          "name": nameC.text,
        });
        Get.snackbar("Berhasil", "Berhasil update profile.");
      } catch (e) {
        Get.snackbar("Terjadi Kesalahan", "Tidak dapat update profile.");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> addAddress(String address) async {
    String uid = auth.currentUser!.uid;
    try {
      await firestore.collection('user').doc(uid).update({
        'address': address,
      });
      Get.snackbar("Success", "Address added successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to add address: $e");
    }
  }
}

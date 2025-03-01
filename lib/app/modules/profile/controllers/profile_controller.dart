import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamUser() {
    String uid = auth.currentUser!.uid;

    return firestore.collection('user').doc(uid).snapshots();
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.login);
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:foodie_fleet_app/app/common/app_style.dart';
import 'package:foodie_fleet_app/app/common/reusable_text.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: Center(
          child: ReusableText(
              text: "Profile ", style: appStyle(22, kDark, FontWeight.w500)),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUser(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          Map<String, dynamic> user = snap.data!.data()!;
          String defaultImage =
              "https://ui-avatars.com/api/?name=${user['name']}";
          return ListView(
            padding: EdgeInsets.all(8),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                        user["profile"] != null
                            ? user["profile"] != ""
                                ? user["profile"]
                                : defaultImage
                            : defaultImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                '${user['name']}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(height: 5),
              Text(
                '${user['email']}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 5),
              Text(
                user["address"]?.isNotEmpty == true
                    ? "Address: ${user["address"]}"
                    : "",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 30),
              ListTile(
                onTap: () => Get.toNamed(Routes.updateProfile, arguments: user),
                leading: Icon(Icons.person),
                title: Text('Update Profile'),
              ),
              ListTile(
                leading: Icon(Icons.key_sharp),
                title: Text('Update Password'),
              ),
              ListTile(
                onTap: () => controller.logout(),
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
              ListTile(
                onTap: () {
                  Get.defaultDialog(
                    title: "Delete Account",
                    middleText: "Are you sure you want to delete your account?",
                    textConfirm: "Yes",
                    textCancel: "No",
                    confirmTextColor: Colors.white,
                    onConfirm: () => controller.deleteUser(),
                  );
                },
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

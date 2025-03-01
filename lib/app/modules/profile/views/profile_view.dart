import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUser(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            Center(
              child: CircularProgressIndicator(),
            );
          }
          Map<String, dynamic> user = snap.data!.data()!;
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
                        "https://ui-avatars.com/api/?name=${user['name']}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${user['name'].toUpperCase()}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${user['email']}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () => Get.toNamed(Routes.UPDATE_PROFILE),
                leading: Icon(Icons.person),
                title: Text('Update Profile'),
              ),
              ListTile(
                onTap: () => Get.toNamed(Routes.UPDATE_PASSWORD),
                leading: Icon(Icons.key_sharp),
                title: Text('Update Password'),
              ),
              ListTile(
                onTap: () => controller.logout(),
                leading: Icon(Icons.logout),
                title: Text('Logout'),
              ),
            ],
          );
        },
      ),
    );
  }
}

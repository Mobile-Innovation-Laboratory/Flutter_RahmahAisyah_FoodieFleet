import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h), // Tinggi AppBar
        child: Container(
          decoration: BoxDecoration(
            color: kOffWhite,
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            toolbarHeight: 70.h,
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: kPrimary,
            title: Image.asset(
              "assets/images/logo.png",
              height: 40, // Sesuaikan ukuran jika perlu
            ),
            centerTitle: true, // Pastikan title tetap di tengah
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamUser(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          Map<String, dynamic> user = snap.data!.data()!;
          String defaultImage =
              "https://ui-avatars.com/api/?name=${user['name']}";

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    user["profile"]?.isNotEmpty == true
                        ? user["profile"]
                        : defaultImage,
                  ),
                ),
                SizedBox(height: 15),

                // User Information Card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          user['name'] ?? "User",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          user['email'] ?? "No email",
                          style:
                              TextStyle(fontSize: 16, color: Colors.grey[700]),
                        ),
                        SizedBox(height: 5),
                        if (user["address"]?.isNotEmpty == true)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.grey[700], size: 20),
                              SizedBox(
                                  width:
                                      5), // Memberi jarak antara ikon dan teks
                              Text(
                                user["address"],
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[700]),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),

                // Menu Options
                _buildMenuItem(Icons.person, "Update Profile", () {
                  Get.toNamed(Routes.updateProfile, arguments: user);
                }),
                _buildMenuItem(Icons.lock, "Update Password", () {}),
                _buildMenuItem(Icons.logout, "Logout", controller.logout),
                _buildMenuItem(Icons.delete, "Delete Account", () {
                  Get.defaultDialog(
                    title: "Delete Account",
                    titleStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    middleText: "Are you sure you want to delete your account?",
                    middleTextStyle:
                        TextStyle(fontSize: 16, color: Colors.grey[700]),
                    backgroundColor: Colors.white,
                    radius: 10,
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () => Get.back(),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.red,
                              backgroundColor: Colors.white,
                              side: BorderSide(color: Colors.red),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: Text("No", style: TextStyle(fontSize: 16)),
                          ),
                          ElevatedButton(
                            onPressed: () => controller.deleteUser(),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: kPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                            child: Text("Yes", style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                    ],
                  );
                }, color: kRed),
              ],
            ),
          );
        },
      ),
    );
  }

  // Widget untuk menu list item
  Widget _buildMenuItem(IconData icon, String text, VoidCallback onTap,
      {Color? color}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: color ?? Colors.black),
        title: Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      ),
    );
  }
}

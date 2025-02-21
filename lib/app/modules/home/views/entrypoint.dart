import 'package:flutter/material.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/modules/home/controllers/tab_index_controller.dart';
import 'package:foodie_fleet_app/app/modules/home/views/cart/cart_page.dart';
import 'package:foodie_fleet_app/app/modules/home/views/home/home_page.dart';
import 'package:foodie_fleet_app/app/modules/home/views/profile/profile_page.dart';
import 'package:foodie_fleet_app/app/modules/home/views/search/search_page.dart';
import 'package:get/get.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Obx(
      () => Scaffold(
        body: Stack(
          children: [
            pageList[controller.tabIndex],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                  data: Theme.of(context).copyWith(canvasColor: kPrimary),
                  child: BottomNavigationBar(
                      showUnselectedLabels: false,
                      showSelectedLabels: true,
                      unselectedIconTheme: const IconThemeData(
                        color: Color.fromARGB(255, 37, 105, 102),
                      ),
                      selectedIconTheme: IconThemeData(color: kLightWhite),
                      onTap: (value) {
                        controller.setTabIndex = value;
                      },
                      currentIndex: controller.tabIndex,
                      items: [
                        BottomNavigationBarItem(
                          icon: controller.tabIndex == 0
                              ? Icon(AntDesign.appstore1)
                              : Icon(AntDesign.appstore_o),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.search),
                          label: 'Search',
                        ),
                        BottomNavigationBarItem(
                          icon: Badge(
                              label: Text('1'),
                              child: Icon(FontAwesome.opencart)),
                          label: 'Cart',
                        ),
                        BottomNavigationBarItem(
                          icon: controller.tabIndex == 3
                              ? Icon(FontAwesome.user_circle)
                              : Icon(FontAwesome.user_circle_o),
                          label: 'Profile',
                        ),
                      ])),
            ),
          ],
        ),
      ),
    );
  }
}

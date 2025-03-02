import 'package:flutter/material.dart';
import 'package:foodie_fleet_app/app/constants/constants.dart';
import 'package:foodie_fleet_app/app/modules/home/controllers/tab_index_controller.dart';
import 'package:foodie_fleet_app/app/modules/home/views/cart/cart_page.dart';
import 'package:foodie_fleet_app/app/modules/home/views/home/home_page.dart';
import 'package:foodie_fleet_app/app/modules/home/views/profile/profile_page.dart';
import 'package:foodie_fleet_app/app/modules/home/views/search/search_page.dart';
import 'package:foodie_fleet_app/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<TabIndexController>()) {
      Get.lazyPut(() => TabIndexController(), fenix: true);
    }

    final TabIndexController controller = Get.find<TabIndexController>();

    return Obx(
      () {
        return Scaffold(
          body: Stack(
            children: [
              IndexedStack(
                index: controller.tabIndex,
                children: [
                  HomePage(),
                  SearchPage(),
                  CartPage(),
                  controller.isLoggedIn.value
                      ? ProfileView(key: ValueKey(controller.isLoggedIn.value))
                      : ProfilePage(),
                ],
              ),
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

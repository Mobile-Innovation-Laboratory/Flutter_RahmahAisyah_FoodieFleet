import 'package:foodie_fleet_app/app/modules/home/views/entrypoint.dart';
import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => MainScreen(),
      binding: HomeBinding(),
    ),
  ];
}

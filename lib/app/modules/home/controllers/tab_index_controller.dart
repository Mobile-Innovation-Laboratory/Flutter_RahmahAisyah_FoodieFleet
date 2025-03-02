import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TabIndexController extends GetxController {
  final RxInt _tabIndex = 0.obs;
  final box = GetStorage();

  int get tabIndex => _tabIndex.value;
  set setTabIndex(int newValue) => _tabIndex.value = newValue;

  RxBool isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = box.read("isLoggedIn") ?? false;
    update(); // Tambahkan ini untuk memperbarui UI
  }
}

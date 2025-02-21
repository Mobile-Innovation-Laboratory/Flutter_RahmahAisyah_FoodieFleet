import 'package:get/get.dart';

import '../controllers/tab_index_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabIndexController>(
      () => TabIndexController(),
    );
  }
}

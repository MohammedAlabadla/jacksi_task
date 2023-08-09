import 'package:get/get.dart';

import 'auth_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => JacksiController(), fenix: true);
  }
}

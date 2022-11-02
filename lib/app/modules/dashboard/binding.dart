import 'package:cermath/app/data/providers/base.dart';
import 'package:cermath/app/data/providers/materi.dart';
import 'package:cermath/app/data/providers/user.dart';
import 'package:cermath/app/modules/dashboard/controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseProvider>(() => BaseProvider());
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<MateriProvider>(() => MateriProvider());

    // Home Controller
    Get.lazyPut<DashboardController>(
      () => DashboardController(
        baseProvider: Get.find(),
        materiProvider: Get.find(),
        userProvider: Get.find(),
      ),
    );

    // Ranking Controller

    // Profile Controller
  }
}

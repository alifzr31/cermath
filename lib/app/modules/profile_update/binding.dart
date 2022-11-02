import 'package:cermath/app/data/providers/base.dart';
import 'package:cermath/app/data/providers/materi.dart';
import 'package:cermath/app/data/providers/user.dart';
import 'package:cermath/app/modules/dashboard/controller.dart';
import 'package:cermath/app/modules/informasi/controller.dart';
import 'package:cermath/app/modules/profile_update/controller.dart';
import 'package:get/get.dart';

class ProfileUpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseProvider>(() => BaseProvider());
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<MateriProvider>(() => MateriProvider());

    Get.lazyPut<DashboardController>(
      () => DashboardController(
        baseProvider: Get.find(),
        materiProvider: Get.find(),
        userProvider: Get.find(),
      ),
    );

    Get.lazyPut<InformasiController>(
      () => InformasiController(
        baseProvider: Get.find(),
        userProvider: Get.find(),
      ),
    );

    Get.lazyPut<ProfileUpdateController>(
      () => ProfileUpdateController(
        baseProvider: Get.find(),
        userProvider: Get.find(),
        informasiController: Get.find(),
        dashboardController: Get.find(),
      ),
    );
  }
}

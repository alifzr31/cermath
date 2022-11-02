import 'package:cermath/app/data/providers/base.dart';
import 'package:cermath/app/data/providers/user.dart';
import 'package:cermath/app/modules/informasi/controller.dart';
import 'package:get/get.dart';

class InformasiBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserProvider>(() => UserProvider());
    Get.lazyPut<BaseProvider>(() => BaseProvider());

    Get.lazyPut<InformasiController>(
      () => InformasiController(
        userProvider: Get.find(),
        baseProvider: Get.find(),
      ),
    );
  }
}

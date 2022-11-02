import 'package:cermath/app/data/providers/materi.dart';
import 'package:cermath/app/modules/submateri/controller.dart';
import 'package:get/get.dart';

class SubMateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MateriProvider>(() => MateriProvider());
    Get.lazyPut<SubMateriController>(
      () => SubMateriController(materiProvider: Get.find()),
    );
  }
}

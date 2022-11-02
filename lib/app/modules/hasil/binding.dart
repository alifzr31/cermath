import 'package:cermath/app/modules/hasil/controller.dart';
import 'package:get/get.dart';

class HasilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HasilController>(() => HasilController());
  }
}

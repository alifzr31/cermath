import 'package:cermath/app/modules/intro/controller.dart';
import 'package:get/get.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(() => IntroController());
  }
}

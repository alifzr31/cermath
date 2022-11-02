import 'package:get/get.dart';

class HasilController extends GetxController {
  @override
  void onInit() {
    print(Get.arguments['answer']);
    super.onInit();
  }
}

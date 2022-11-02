import 'package:cermath/app/data/providers/auth.dart';
import 'package:cermath/app/modules/signin/controller.dart';
import 'package:get/get.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<SigninController>(
        () => SigninController(authProvider: Get.find()));
  }
}

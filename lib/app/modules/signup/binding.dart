import 'package:cermath/app/data/providers/auth.dart';
import 'package:cermath/app/modules/signup/controller.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<SignupController>(
      () => SignupController(authProvider: Get.find()),
    );
  }
}

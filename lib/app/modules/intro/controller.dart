import 'dart:convert';

import 'package:cermath/app/data/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class IntroController extends GetxController {
  final localStorage = GetStorage();
  User? user;

  void checkAuth() {
    var data = localStorage.read('user');
    if (data != null) {
      user = userFromJson(jsonEncode(data));
    }
    if (user?.token == null) {
      Get.offAndToNamed('/signin');
    } else if (user?.classId == null) {
      Get.offAndToNamed('/informasi');
    } else {
      Get.offAndToNamed('/dashboard');
    }
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:cermath/app/data/providers/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final AuthProvider authProvider;

  SignupController({required this.authProvider});

  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscureText = true.obs;

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void register() async {
    var data = {
      'fullname': fullNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };
    try {
      var response = await authProvider.register(data);
      var body = jsonDecode(response.body);
      print(body);
      if (body['success']) {
        Get.snackbar('Berhasil', 'Berhasil membuat akun');
        Get.back();
      } else {
        Get.snackbar('Gagal', body['message']);
      }
    } on IOException catch (_) {
      Get.snackbar('Offline', 'No internet access');
    }
  }
}

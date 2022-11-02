import 'dart:convert';
import 'dart:io';

import 'package:cermath/app/data/providers/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  final AuthProvider authProvider;
  SigninController({required this.authProvider});

  final formKey = GlobalKey<FormState>();
  final localStorage = GetStorage();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscureText = true.obs;

  void login() async {
    var data = ({
      'email': emailController.text,
      'password': passwordController.text,
    });

    try {
      var response = await authProvider.login(data);
      var body = jsonDecode(response.body);
      if (body['success']) {
        if (body['data']['class_id'] == null) {
          await localStorage.write('user', body['data']);
          Get.offAndToNamed('/informasi', arguments: body['data']['users_id']);
        } else {
          await localStorage.write('user', body['data']);
          Get.offAndToNamed('/dashboard');
        }
      } else {
        Get.snackbar('Unauthorized', body['message']);
      }
    } on IOException {
      Get.snackbar('Offline', 'No internet access');
    }
  }
}

import 'dart:convert';

import 'package:cermath/app/data/providers/base.dart';
import 'package:cermath/app/data/providers/user.dart';
import 'package:cermath/app/modules/dashboard/controller.dart';
import 'package:cermath/app/modules/informasi/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileUpdateController extends GetxController {
  final BaseProvider baseProvider;
  final UserProvider userProvider;
  final InformasiController informasiController;
  final DashboardController dashboardController;

  ProfileUpdateController({
    required this.baseProvider,
    required this.userProvider,
    required this.informasiController,
    required this.dashboardController,
  });

  final localStorage = GetStorage();

  final fullNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String? selectedGender;
  String? selectedUserType;
  String? selectedKelas;

  @override
  void onInit() {
    fetchCurrentUser();
    super.onInit();
  }

  void fetchCurrentUser() {
    fullNameController.text = dashboardController.user.value!.fullname;
    usernameController.text = dashboardController.user.value!.username;
    selectedGender = dashboardController.user.value!.genderId.toString();
    selectedUserType = dashboardController.user.value!.usertypeId.toString();
    selectedKelas = dashboardController.user.value!.classId.toString();
    emailController.text = dashboardController.user.value!.email;
    phoneController.text = dashboardController.user.value!.phone ?? "";

    update();
  }

  void updateProfile() async {
    var data = {
      'fullname': fullNameController.text,
      'username': usernameController.text,
      'usertype': selectedUserType,
      'gender': selectedGender,
      'classid': selectedKelas,
      'phone': phoneController.text
    };

    var response = await userProvider.updateProfile(
      data,
      dashboardController.user.value!.usersId,
    );
    var body = jsonDecode(response.body);

    if (body['success']) {
      Get.back();
      dashboardController.fetchUser();
      Get.snackbar('Berhasil', 'Profile berhasil diupdate');
    }
  }
}

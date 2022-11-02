import 'dart:convert';
import 'dart:io';

import 'package:cermath/app/data/models/class.dart';
import 'package:cermath/app/data/models/materi.dart';
import 'package:cermath/app/data/models/user.dart';
import 'package:cermath/app/data/providers/base.dart';
import 'package:cermath/app/data/providers/materi.dart';
import 'package:cermath/app/data/providers/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DashboardController extends GetxController {
  final BaseProvider baseProvider;
  final MateriProvider materiProvider;
  final UserProvider userProvider;
  DashboardController({
    required this.baseProvider,
    required this.materiProvider,
    required this.userProvider,
  });

  final localStorage = GetStorage();
  final tabIndex = 0.obs;
  final isLoading = true.obs;

  final user = Rx<User?>(null);
  final listClass = RxList<Class>();
  final listMateri = RxList<Materi>();
  final selectedClass = Rx<String?>(null);

  final searchController = TextEditingController().obs;

  @override
  void onInit() {
    fetchUser();
    fetchClass();
    fetchMateri();

    ever(
      selectedClass,
      (_) => {
        if (listMateri.isNotEmpty)
          {
            listMateri.value = [],
            fetchMateri(),
          }
        else
          {
            fetchMateri(),
          }
      },
    );

    super.onInit();
  }

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  void fetchUser() async {
    // Raad user data on Local Storage
    var currentUser = localStorage.read('user');

    // Hit API
    var response = await userProvider.fetchUserById(currentUser['users_id']);
    var body = jsonDecode(response.body);

    user.value = userFromJson(jsonEncode(body[0]));
    selectedClass.value = body[0]['class_id'].toString();

    update();
  }

  void fetchClass() async {
    var response = await baseProvider.fetchClass();
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      listClass.value = classFromJson(jsonEncode(body['data']));
      update();
    }
  }

  void fetchMateri() async {
    isLoading.value = true;
    update();
    try {
      var response =
          await materiProvider.fetchMateri(selectedClass.value.toString());
      var body = jsonDecode(response.body);
      if (body['success']) {
        listMateri.value = body['data'] == null
            ? []
            : materiFromJson(jsonEncode(body['data']));
        isLoading.value = false;
        update();
      }
    } on IOException catch (_) {
      Get.snackbar('No Internet Access', 'Periksa kembali jaringan anda');
    }
  }

  // Page Profile
  void logout() {
    localStorage.remove('user');
    Get.offAllNamed('/signin');
  }
}

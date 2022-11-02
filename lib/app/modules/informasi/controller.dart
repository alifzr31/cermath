import 'dart:convert';
import 'dart:io';

import 'package:cermath/app/data/models/class.dart';
import 'package:cermath/app/data/models/gender.dart';
import 'package:cermath/app/data/models/usertype.dart';
import 'package:cermath/app/data/providers/base.dart';
import 'package:cermath/app/data/providers/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InformasiController extends GetxController {
  final UserProvider userProvider;
  final BaseProvider baseProvider;
  InformasiController({
    required this.userProvider,
    required this.baseProvider,
  });

  final formKey = GlobalKey<FormState>();
  final localStorage = GetStorage();

  final genders = <Gender>[].obs;
  final userTypes = <UserType>[].obs;
  final userClass = <Class>[].obs;

  String? selectedGender;
  String? selectedUserType;
  String? selectedClass;

  @override
  void onInit() async {
    fetchGenders();
    fetchUserTypes();
    fetchClass();
    super.onInit();
  }

  void fetchGenders() async {
    var response = await baseProvider.fetchGenders();
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      genders.value = genderFromJson(jsonEncode(body['data']));
      update();
    }
  }

  void fetchUserTypes() async {
    var response = await baseProvider.fetchUserTypes();
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      userTypes.value = userTypeFromJson(jsonEncode(body['data']));
      update();
    }
  }

  void fetchClass() async {
    var response = await baseProvider.fetchClass();
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      userClass.value = classFromJson(jsonEncode(body['data']));
      update();
    }
  }

  void updateInformation() async {
    var data = {
      'gender': selectedGender.toString(),
      'usertype': selectedUserType.toString(),
      'classid': selectedUserType.toString(),
    };

    try {
      var response = await userProvider.updateInformation(data, Get.arguments);
      var body = jsonDecode(response.body);
      if (body['success']) {
        var user = localStorage.read('user');
        user['gender_id'] = int.parse(selectedGender.toString());
        user['usertype_id'] = int.parse(selectedUserType.toString());
        user['class_id'] = int.parse(selectedClass.toString());
        await localStorage.write('user', user);
        Get.offAndToNamed('/dashboard');
      }
    } on IOException catch (_) {}
  }
}

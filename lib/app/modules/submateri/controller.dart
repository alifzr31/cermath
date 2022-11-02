import 'dart:convert';

import 'package:cermath/app/data/models/sub_materi.dart';
import 'package:cermath/app/data/providers/materi.dart';
import 'package:get/get.dart';

class SubMateriController extends GetxController {
  MateriProvider materiProvider;
  SubMateriController({required this.materiProvider});

  final materiName = ''.obs;
  final subMateri = <SubMateri>[].obs;
  final lessonId = ''.obs;

  @override
  void onInit() {
    lessonId.value = Get.arguments['lessonId'];
    materiName.value = Get.arguments['lessonName'];
    fetchSubMateri();
    super.onInit();
  }

  void fetchSubMateri() async {
    var response =
        await materiProvider.fetchSubMateri(Get.arguments['lessonId']);
    var body = jsonDecode(response.body);
    subMateri.value = subMateriFromJson(jsonEncode(body['data']));
    update();
  }
}

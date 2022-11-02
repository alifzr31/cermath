import 'package:cermath/app/data/providers/question.dart';
import 'package:cermath/app/modules/soal/controller.dart';
import 'package:get/get.dart';

class SoalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionProvider>(() => QuestionProvider());

    Get.lazyPut<SoalController>(
      () => SoalController(questionProvider: Get.find()),
    );
  }
}

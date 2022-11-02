import 'package:cermath/app/data/providers/question.dart';
import 'package:cermath/app/modules/list_soal/controller.dart';
import 'package:get/get.dart';

class QuestionListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionProvider>(() => QuestionProvider());
    Get.lazyPut<QuestionListController>(
      () => QuestionListController(questionProvider: Get.find()),
    );
  }
}

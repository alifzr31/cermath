import 'dart:convert';

import 'package:cermath/app/data/models/quiz_list.dart';
import 'package:cermath/app/data/providers/question.dart';
import 'package:get/get.dart';

class QuestionListController extends GetxController {
  QuestionProvider questionProvider;
  QuestionListController({required this.questionProvider});

  final quizList = <QuizList>[].obs;
  final materiName = ''.obs;

  @override
  void onInit() {
    materiName.value = Get.arguments['lessonName'];

    fetchQuizList();
    super.onInit();
  }

  void fetchQuizList() async {
    var response = await questionProvider.fetchListQuiz(
      Get.arguments['lessonId'],
    );
    var body = jsonDecode(response.body);

    quizList.value = quizListFromJson(jsonEncode(body['data']));
    update();
  }
}

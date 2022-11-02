import 'dart:convert';

import 'package:cermath/app/data/providers/question.dart';
import 'package:get/get.dart';

class SoalController extends GetxController {
  QuestionProvider questionProvider;
  SoalController({required this.questionProvider});

  List<dynamic> question = [];
  String questionName = '';
  List<dynamic> answer = [];
  int currentIndex = 0;
  int totalScore = 0;
  final selectedOptions = ''.obs;

  @override
  void onInit() {
    fetchQuestion();
    super.onInit();
  }

  void fetchQuestion() async {
    var response = await questionProvider.fetchQuestion(Get.arguments);
    var body = jsonDecode(response.body);
    if (body['success']) {
      question = body['data']['listQuiz'];
      questionName = body['data']['quizName'];
      question.forEach((_) {
        answer.add('');
      });
      update();
    }
  }

  void changeQuestion(int i) {
    currentIndex = i - 1;
    update();
  }

  void nextQuestion() {
    if (currentIndex == question.length - 1) {
      selectedOptions.value == question[currentIndex]['answer']
          ? answer.insert(
              currentIndex, int.parse(question[currentIndex]['questionScore']))
          : answer.insert(currentIndex, 0);
      Get.toNamed('/hasil', arguments: {
        'questionName': questionName,
        'answer': answer,
      });
    } else {
      selectedOptions.value == question[currentIndex]['answer']
          ? answer[currentIndex] = selectedOptions.value
          : answer[currentIndex] = selectedOptions.value;
      print(answer);
      selectedOptions.value = '';
      currentIndex++;
    }
    update();
  }

  void prevQuestion() {
    if (currentIndex >= 0) {
      currentIndex--;
      selectedOptions.value = answer[currentIndex] ?? "";
    }
    answer[currentIndex] = '';

    update();
  }
}

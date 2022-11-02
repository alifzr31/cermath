import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/list_soal/controller.dart';
import 'package:cermath/app/modules/list_soal/widgets/card_question_list.dart';
import 'package:cermath/app/widgets/base_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSoalPage extends StatelessWidget {
  final controller = Get.find<QuestionListController>();
  ListSoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        automaticallyImplyLeading: false,
        toolbarHeight: 141,
        elevation: 5,
        flexibleSpace: Padding(
          padding: const EdgeInsets.only(left: 22, top: 42, right: 22),
          child: Obx(
            () => CustomAppBar(
              heading: 'Latihan Soal',
              subHeading: controller.materiName.value,
            ),
          ),
        ),
      ),
      body: Obx(
        () => ListView(
          children: [
            ...controller.quizList
                .map(
                  (element) => CardQuestionList(
                    quizList: element,
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}

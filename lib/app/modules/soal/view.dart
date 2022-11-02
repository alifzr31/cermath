import 'package:cermath/app/core/utils/helper.dart';
import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/soal/controller.dart';
import 'package:cermath/app/modules/soal/widgets/list_opsi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SoalPage extends StatelessWidget {
  final controller = Get.find<SoalController>();
  SoalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.questionName),
        automaticallyImplyLeading: false,
        backgroundColor: purple,
      ),
      body: GetBuilder<SoalController>(
        builder: (context) {
          return controller.question.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var i = 1; i <= 10; i++)
                              InkWell(
                                onTap: () => controller.changeQuestion(i),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: controller.currentIndex == i - 1
                                        ? orange
                                        : Colors.white,
                                    border: Border.all(
                                      color: Colors.grey[200]!,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    i.toString(),
                                    style: TextStyle(
                                      color: controller.currentIndex == i - 1
                                          ? Colors.white
                                          : purple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 22,
                      ),
                      child: Row(
                        children: [
                          Text(
                            '${controller.currentIndex + 1}. ',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${controller.question[controller.currentIndex]['questionName']}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    controller.question[controller.currentIndex]
                                ['questionImage'] ==
                            ""
                        ? Container()
                        : Container(
                            width: 150,
                            height: 150,
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Helper().base64ToImage(
                              base64:
                                  controller.question[controller.currentIndex]
                                      ['questionImage'],
                            ),
                          ),
                    const ListOpsi()
                  ],
                );
        },
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<SoalController>(
          builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: controller.currentIndex == 0 ? false : true,
                  child: SizedBox(
                    width: Get.width / 2.2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: orange,
                        elevation: 0,
                        side: const BorderSide(
                          color: orange,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        controller.prevQuestion();
                      },
                      child: const Text(
                        'Sebelumnya',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width / 2.2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () => controller.nextQuestion(),
                    child: Text(
                      controller.currentIndex == controller.question.length - 1
                          ? "Selesai"
                          : 'Selanjutnya',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

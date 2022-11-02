import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/soal/controller.dart';
import 'package:cermath/app/modules/soal/widgets/opsi_soal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOpsi extends StatelessWidget {
  const ListOpsi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SoalController soalCtrl = Get.find<SoalController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: GetBuilder<SoalController>(
        builder: (context) {
          return Obx(
            () => Column(
              children: [
                OpsiSoal(
                  opsi: 'A',
                  opsiColor: soalCtrl.selectedOptions.value ==
                          soalCtrl.question[soalCtrl.currentIndex]['answer1']
                      ? Colors.white
                      : Colors.black,
                  opsiBgColor: soalCtrl.selectedOptions.value ==
                          soalCtrl.question[soalCtrl.currentIndex]['answer1']
                      ? orange
                      : const Color(0xFFFCD954),
                  jawaban: soalCtrl.question[soalCtrl.currentIndex]['answer1'],
                  onPressed: () => soalCtrl.selectedOptions.value =
                      soalCtrl.question[soalCtrl.currentIndex]['answer1'],
                ),
                OpsiSoal(
                  opsi: 'B',
                  opsiColor: soalCtrl.selectedOptions.value ==
                          soalCtrl.question[soalCtrl.currentIndex]['answer2']
                      ? Colors.white
                      : Colors.black,
                  opsiBgColor: soalCtrl.selectedOptions.value ==
                          soalCtrl.question[soalCtrl.currentIndex]['answer2']
                      ? orange
                      : const Color(0xFFFCD954),
                  jawaban: soalCtrl.question[soalCtrl.currentIndex]['answer2'],
                  onPressed: () => soalCtrl.selectedOptions.value =
                      soalCtrl.question[soalCtrl.currentIndex]['answer2'],
                ),
                OpsiSoal(
                  opsi: 'C',
                  opsiColor: soalCtrl.selectedOptions.value ==
                          soalCtrl.question[soalCtrl.currentIndex]['answer3']
                      ? Colors.white
                      : Colors.black,
                  opsiBgColor: soalCtrl.selectedOptions.value ==
                          soalCtrl.question[soalCtrl.currentIndex]['answer3']
                      ? orange
                      : const Color(0xFFFCD954),
                  jawaban: soalCtrl.question[soalCtrl.currentIndex]['answer3'],
                  onPressed: () => soalCtrl.selectedOptions.value =
                      soalCtrl.question[soalCtrl.currentIndex]['answer3'],
                ),
                OpsiSoal(
                  opsi: 'D',
                  opsiColor: soalCtrl.selectedOptions.value ==
                          soalCtrl.question[soalCtrl.currentIndex]['answer4']
                      ? Colors.white
                      : Colors.black,
                  opsiBgColor: soalCtrl.selectedOptions.value ==
                          soalCtrl.question[soalCtrl.currentIndex]['answer4']
                      ? orange
                      : const Color(0xFFFCD954),
                  jawaban: soalCtrl.question[soalCtrl.currentIndex]['answer4'],
                  onPressed: () => soalCtrl.selectedOptions.value =
                      soalCtrl.question[soalCtrl.currentIndex]['answer4'],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

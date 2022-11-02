import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/submateri/controller.dart';
import 'package:cermath/app/modules/submateri/widgets/card_sub_materi.dart';
import 'package:cermath/app/widgets/base_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SubMateriPage extends StatelessWidget {
  final controller = Get.find<SubMateriController>();
  SubMateriPage({super.key});

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
              heading: 'BAB I - ${controller.materiName}',
              subHeading: "${controller.subMateri.length} Materi",
            ),
          ),
        ),
      ),
      body: Obx(
        () => ListView(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(
                    '/list-soal',
                    arguments: {
                      'lessonId': controller.lessonId.value,
                      'lessonName': controller.materiName.value
                    },
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE5E5E5),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          LineIcons.tasks,
                          size: 20,
                          color: orange,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Latihan Soal',
                          style: TextStyle(
                            color: orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            ...controller.subMateri
                .map(
                  (element) => CardSubMateri(
                    subMateri: element,
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}

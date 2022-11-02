import 'package:cermath/app/core/utils/helper.dart';
import 'package:cermath/app/data/models/materi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardMateri extends StatelessWidget {
  final Materi materi;
  const CardMateri({
    Key? key,
    required this.materi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        '/submateri',
        arguments: {
          "lessonId": materi.lessonId,
          "lessonName": materi.lessonName,
        },
      ),
      child: SizedBox(
        child: Column(
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Helper().base64ToImage(base64: materi.lessonImage),
            ),
            const SizedBox(height: 8),
            Text(
              materi.lessonName,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cermath/app/core/utils/helper.dart';
import 'package:cermath/app/data/models/sub_materi.dart';
import 'package:flutter/material.dart';

class CardSubMateri extends StatelessWidget {
  final SubMateri subMateri;
  const CardSubMateri({
    Key? key,
    required this.subMateri,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Helper().base64ToImage(
              base64: subMateri.sublessonImage,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            subMateri.sublessonName,
          )
        ],
      ),
    );
  }
}

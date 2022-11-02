import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpsiSoal extends StatelessWidget {
  final String opsi;
  final Color opsiColor;
  final Color opsiBgColor;
  final String jawaban;
  final void Function()? onPressed;

  const OpsiSoal({
    Key? key,
    required this.opsi,
    required this.opsiColor,
    required this.opsiBgColor,
    required this.jawaban,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 45,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          side: BorderSide(
            color: Colors.grey[350]!,
          ),
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: opsiBgColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  opsi,
                  style: TextStyle(
                    fontSize: 16,
                    color: opsiColor,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              jawaban,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

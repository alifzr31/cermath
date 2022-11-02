import 'package:cermath/app/core/value/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  final void Function()? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: baseColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 0.8,
              color: baseColor.withOpacity(
                0.2,
              ),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
        ),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(
            color: baseColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

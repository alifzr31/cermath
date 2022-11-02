import 'package:cermath/app/core/value/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String heading;
  final String subHeading;

  const CustomAppBar({
    Key? key,
    required this.heading,
    required this.subHeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: orange,
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 25),
        Text(
          heading,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            wordSpacing: 2,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subHeading,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

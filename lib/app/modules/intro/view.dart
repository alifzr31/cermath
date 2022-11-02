import 'package:cermath/app/modules/intro/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

class IntroPage extends StatelessWidget {
  final controller = Get.find<IntroController>();
  IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 81,
                horizontal: 80,
              ),
              child: SvgPicture.asset(
                'assets/images/intro.svg',
                width: Get.width * 0.7,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Text('Learn Fast'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'Selamat datang di \ncerMath',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Divider(
                thickness: 1,
                indent: 22,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                'Aplikasi untuk mempelajari dasar dan meningkatkan keterampilan anda dalam matematika.',
                style: TextStyle(wordSpacing: 5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 46, horizontal: 8),
              child: Builder(
                builder: (context) {
                  final GlobalKey<SlideActionState> key = GlobalKey();
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SlideAction(
                      key: key,
                      sliderRotate: false,
                      text: 'Get Started',
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      onSubmit: () async {
                        await key.currentState!.reset();
                        controller.checkAuth();
                      },
                      innerColor: Colors.black,
                      outerColor: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

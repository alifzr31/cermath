import 'package:cermath/app/widgets/base_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/signin/controller.dart';
import 'package:cermath/app/widgets/base_text_form_field.dart';
import 'package:line_icons/line_icons.dart';

class SigninPage extends StatelessWidget {
  final controller = Get.find<SigninController>();
  SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 22,
                top: 50,
                right: 22,
                bottom: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Text>[
                  Text(
                    'cerMath',
                    style: TextStyle(
                      color: orange,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Masuk untuk melanjutkan!',
                    style: TextStyle(
                      color: purple,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Obx(
                () => Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseTextFormField(
                        title: 'Email',
                        controller: controller.emailController,
                        hintText: 'Masukan e-mail anda',
                        prefixIconData: LineIcons.envelope,
                        validator: (value) {
                          if (value!.isEmpty) return 'E-mail harus diisi';
                          if (!GetUtils.isEmail(value)) {
                            return 'E-mail tidak valid';
                          }
                          return null;
                        },
                      ),
                      BaseTextFormField(
                        title: 'Password',
                        controller: controller.passwordController,
                        hintText: 'Masukan password anda',
                        prefixIconData: LineIcons.lock,
                        suffixIcon: GestureDetector(
                          onTap: () => controller.obscureText.toggle(),
                          child: Icon(
                            controller.obscureText.value
                                ? LineIcons.eye
                                : LineIcons.eyeSlash,
                            color: baseColor,
                          ),
                        ),
                        obscureText: controller.obscureText.value,
                        validator: (value) {
                          if (value!.isEmpty) return 'Password harus diisi';
                          return null;
                        },
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Lupa Password?',
                          style: TextStyle(
                            color: purple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      BaseButton(
                        buttonText: 'Login',
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.login();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Belum memiliki akun? ',
                style: const TextStyle(
                  fontSize: 13,
                  color: baseColor,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Daftar Disini',
                    style: const TextStyle(
                      color: orange,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        controller.emailController.clear();
                        controller.passwordController.clear();
                        Get.toNamed('/signup');
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

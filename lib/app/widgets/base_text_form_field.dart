import 'package:cermath/app/core/value/colors.dart';
import 'package:flutter/material.dart';

class BaseTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final IconData? prefixIconData;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const BaseTextFormField({
    Key? key,
    required this.title,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.suffixIcon,
    this.prefixIconData,
    this.obscureText = false,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: baseColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(fontSize: 13),
              prefixIcon: Icon(
                prefixIconData,
                color: baseColor,
              ),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: baseColor,
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: baseColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 0.8,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              isDense: true,
            ),
            style: const TextStyle(color: baseColor),
            obscureText: obscureText,
            textAlignVertical: TextAlignVertical.center,
            cursorHeight: 20,
            validator: validator,
          ),
        ],
      ),
    );
  }
}

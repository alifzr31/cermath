import 'package:cermath/app/core/value/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class BaseDropdownButton extends StatelessWidget {
  final String title;
  final String hintText;
  final String? value;
  final String? Function(String?)? validator;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;

  const BaseDropdownButton({
    Key? key,
    required this.title,
    required this.hintText,
    this.validator,
    this.items,
    this.onChanged,
    this.onSaved,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          DropdownButtonFormField2(
            value: value,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0.8,
                  color: baseColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 1,
                  color: baseColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            isExpanded: true,
            hint: Text(
              hintText,
              style: const TextStyle(fontSize: 14),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: baseColor,
            ),
            iconSize: 30,
            buttonHeight: 50,
            buttonPadding: const EdgeInsets.only(
              left: 20,
              right: 10,
            ),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            items: items,
            validator: validator,
            onChanged: onChanged,
            onSaved: onSaved,
          ),
        ],
      ),
    );
  }
}

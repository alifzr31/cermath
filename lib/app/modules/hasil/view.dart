import 'package:cermath/app/modules/hasil/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HasilPage extends StatelessWidget {
  final HasilController controller = Get.find<HasilController>();
  HasilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
      ),
    );
  }
}

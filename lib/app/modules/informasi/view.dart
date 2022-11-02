import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/informasi/controller.dart';
import 'package:cermath/app/widgets/base_button.dart';
import 'package:cermath/app/widgets/base_dropdown_button.dart';

class InformasiPage extends StatelessWidget {
  final controller = Get.find<InformasiController>();
  InformasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height / 3,
                  color: purple,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(42.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'cerMath',
                            style: TextStyle(
                              color: orange,
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                            width: Get.width,
                          ),
                          const Text(
                            'Mohon lengkapi semua informasi',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(29),
                          topRight: Radius.circular(29),
                        ),
                      ),
                      child: Form(
                        key: controller.formKey,
                        child: GetBuilder<InformasiController>(
                          builder: (controller) {
                            return Column(
                              children: [
                                BaseDropdownButton(
                                  title: 'Jenis Kelamin',
                                  hintText: 'Pilih jenis kelamin',
                                  items: controller.genders
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e.genderId.toString(),
                                          child: Text(e.genderName),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) =>
                                      controller.selectedGender = value,
                                  onSaved: (value) =>
                                      controller.selectedGender = value,
                                  validator: (value) {
                                    if (GetUtils.isNull(value)) {
                                      return 'Jenis kelamin harus diisi';
                                    }
                                    return null;
                                  },
                                ),
                                BaseDropdownButton(
                                  title: 'Tipe Pengguna',
                                  hintText: 'Pilih tipe pengguna',
                                  items: controller.userTypes
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e.usertypeId.toString(),
                                          child: Text(e.usertypeName),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) =>
                                      controller.selectedUserType = value,
                                  onSaved: (value) =>
                                      controller.selectedUserType = value,
                                  validator: (value) {
                                    if (GetUtils.isNull(value)) {
                                      return 'Tipe pengguna harus diisi';
                                    }
                                    return null;
                                  },
                                ),
                                BaseDropdownButton(
                                  title: 'Kelas',
                                  hintText: 'Pilih kelas',
                                  items: controller.userClass
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          value: e.classId.toString(),
                                          child: Text(e.className),
                                        ),
                                      )
                                      .toList(),
                                  onChanged: (value) =>
                                      controller.selectedClass = value,
                                  onSaved: (value) =>
                                      controller.selectedClass = value,
                                  validator: (value) {
                                    if (GetUtils.isNull(value)) {
                                      return 'Kelas harus diisi';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 30),
                                BaseButton(
                                  buttonText: 'Simpan Informasi',
                                  onPressed: () {
                                    if (controller.formKey.currentState!
                                        .validate()) {
                                      controller.updateInformation();
                                    }
                                  },
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

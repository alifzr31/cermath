import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/informasi/controller.dart';
import 'package:cermath/app/modules/profile_update/controller.dart';
import 'package:cermath/app/widgets/base_button.dart';
import 'package:cermath/app/widgets/base_dropdown_button.dart';
import 'package:cermath/app/widgets/base_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ProfileUpdatePage extends StatelessWidget {
  final controller = Get.find<ProfileUpdateController>();
  final informasiController = Get.find<InformasiController>();
  ProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        centerTitle: true,
        title: const Text(
          'Ubah Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Form(
              child: GetBuilder(
                init: informasiController,
                builder: (_) {
                  return Column(
                    children: [
                      BaseTextFormField(
                        title: 'Nama Lengkap',
                        controller: controller.fullNameController,
                        hintText: 'Nama Lengkap',
                        prefixIconData: LineIcons.user,
                      ),
                      BaseTextFormField(
                        title: 'Username',
                        controller: controller.usernameController,
                        hintText: 'Username',
                        prefixIconData: LineIcons.user,
                      ),
                      BaseDropdownButton(
                        title: 'Jenis Kelamin',
                        hintText: 'Pilih jenis kelamin',
                        value: controller.selectedGender,
                        items: informasiController.genders
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e.genderId.toString(),
                                child: Text(e.genderName),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          controller.selectedGender = value;
                        },
                        onSaved: (value) {},
                      ),
                      BaseDropdownButton(
                        title: 'Tipe Pengguna',
                        hintText: 'Pilih tipe pengguna',
                        value: controller.selectedUserType ?? "1",
                        items: informasiController.userTypes
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e.usertypeId.toString(),
                                child: Text(e.usertypeName),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          controller.selectedUserType = value;
                        },
                        onSaved: (value) {},
                      ),
                      BaseDropdownButton(
                        title: 'Kelas',
                        hintText: 'Pilih kelas',
                        value: controller.selectedKelas ?? "1",
                        items: informasiController.userClass
                            .map(
                              (e) => DropdownMenuItem<String>(
                                value: e.classId.toString(),
                                child: Text(e.className),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          controller.selectedKelas = value;
                        },
                        onSaved: (value) {},
                      ),
                      BaseTextFormField(
                        title: 'No. Telp',
                        controller: controller.phoneController,
                        prefixIconData: LineIcons.mobilePhone,
                      ),
                      const SizedBox(height: 30),
                      BaseButton(
                        onPressed: () {
                          controller.updateProfile();
                        },
                        buttonText: 'Simpan Informasi',
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

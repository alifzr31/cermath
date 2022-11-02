import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class ProfilePage extends StatelessWidget {
  final controller = Get.find<DashboardController>();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            letterSpacing: 0.8,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: purple,
        centerTitle: true,
      ),
      body: Obx(
        () => controller.user.value == null
            ? Container()
            : ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[100],
                              radius: 30,
                              child: const Icon(
                                LineIcons.user,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 220,
                                  child: Text(
                                    controller.user.value!.fullname,
                                    overflow: TextOverflow.visible,
                                    softWrap: true,
                                    style: const TextStyle(
                                      color: baseColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  controller.user.value!.classId == 1
                                      ? "Kelas 7"
                                      : controller.user.value!.classId == 2
                                          ? "Kelas 8"
                                          : "Kelas 9",
                                )
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            Get.toNamed(
                              '/edit-profile',
                              arguments: controller.user.value!.usersId,
                            );
                          },
                          icon: const Icon(
                            LineIcons.editAlt,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Informasi',
                      style: TextStyle(
                        color: baseColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    margin:
                        const EdgeInsets.only(left: 14, right: 14, bottom: 22),
                    padding:
                        const EdgeInsets.symmetric(vertical: 9, horizontal: 14),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFE5E5E5),
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email'),
                        const SizedBox(height: 3),
                        Text(
                          controller.user.value!.email,
                          style: const TextStyle(
                            color: baseColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Tipe Pengguna'),
                        const SizedBox(height: 3),
                        Text(
                          controller.user.value!.usertypeId == 1
                              ? "Siswa"
                              : controller.user.value!.usertypeId == 2
                                  ? "Guru"
                                  : "Umum",
                          style: const TextStyle(
                            color: baseColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Statistik',
                      style: TextStyle(
                        color: baseColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: Get.width / 2,
                        margin: const EdgeInsets.only(
                          left: 14,
                          right: 14,
                          bottom: 22,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 9,
                          horizontal: 14,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFE5E5E5),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              '4500',
                              style: TextStyle(
                                color: baseColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text('Total Exp'),
                          ],
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Pengaturan Akun',
                      style: TextStyle(
                        color: baseColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ButtonAkun(
                    onTap: () {},
                    label: 'Ubah kata sandi',
                  ),
                  ButtonAkun(
                    onTap: () {},
                    label: 'Ketentuan Pengguna',
                  ),
                  ButtonAkun(
                    onTap: () => controller.logout(),
                    label: 'Keluar',
                  ),
                ],
              ),
      ),
    );
  }
}

class ButtonAkun extends StatelessWidget {
  final void Function()? onTap;
  final String label;

  const ButtonAkun({
    Key? key,
    this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE5E5E5),
              width: 0.8,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
            ),
            const Icon(
              LineIcons.angleRight,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/dashboard/controller.dart';
import 'package:cermath/app/modules/dashboard/widgets/card_materi.dart';
import 'package:cermath/app/modules/dashboard/widgets/custom_bottom_navbar.dart';
import 'package:cermath/app/modules/profile/view.dart';
import 'package:cermath/app/modules/rangking/view.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class DashboardPage extends StatelessWidget {
  final controller = Get.find<DashboardController>();
  DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.tabIndex.value,
          children: [
            SafeArea(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 42,
                      horizontal: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            controller.user.value == null
                                ? ""
                                : 'Hi, ${controller.user.value!.username}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: baseColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 110,
                          height: 40,
                          child: DropdownButtonFormField2(
                            value: controller.selectedClass.value,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            isExpanded: true,
                            hint: const Text(
                              'Kelas',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                            iconSize: 25,
                            buttonHeight: 40,
                            buttonPadding:
                                const EdgeInsets.only(left: 20, right: 10),
                            buttonDecoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            dropdownDecoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            items: controller.listClass
                                .map(
                                  (item) => DropdownMenuItem<String>(
                                    value: item.classId.toString(),
                                    child: Text(
                                      'Kelas ${item.className}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              controller.selectedClass.value = value.toString();
                            },
                            onSaved: (value) {
                              controller.selectedClass.value = value.toString();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: Container(
                      width: Get.width,
                      height: 127,
                      decoration: BoxDecoration(
                        color: purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 17,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mari belajar bersama',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextFormField(
                                controller: controller.searchController.value,
                                decoration: const InputDecoration(
                                  hintText: 'Cari Topik',
                                  border: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 22,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Kategori',
                          style: TextStyle(
                            color: baseColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                            overlayColor: MaterialStatePropertyAll(
                              Colors.transparent,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Lihat semua',
                            style: TextStyle(
                              color: Color(0xFF8F8F8F),
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GetBuilder<DashboardController>(
                    builder: (_) {
                      return controller.isLoading.value
                          ? SizedBox(
                              height: Get.height / 2.5,
                              child: const CupertinoActivityIndicator(),
                            )
                          : controller.listMateri.isEmpty
                              ? SizedBox(
                                  height: Get.height / 2.5,
                                  child: const Center(
                                    child: Text(
                                      'Materi tidak ada',
                                      style: TextStyle(
                                        color: baseColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 12,
                                    children: [
                                      ...controller.listMateri.map((e) {
                                        return CardMateri(materi: e);
                                      }).toList(),
                                    ],
                                  ),
                                );
                    },
                  ),
                ],
              ),
            ),
            RankingPage(),
            ProfilePage()
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavbar(),
    );
  }
}

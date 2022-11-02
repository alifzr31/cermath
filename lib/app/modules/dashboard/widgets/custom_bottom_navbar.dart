// ignore_for_file: must_be_immutable

import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavbar extends StatelessWidget {
  DashboardController dashboardController = Get.find();
  CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SalomonBottomBar(
        currentIndex: dashboardController.tabIndex.value,
        onTap: (int index) => dashboardController.changeTabIndex(index),
        itemPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        unselectedItemColor: Colors.grey[600],
        items: [
          SalomonBottomBarItem(
            icon: const Icon(LineIcons.school),
            title: const Text("Home"),
            selectedColor: purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(LineIcons.award),
            title: const Text("Ranking"),
            selectedColor: purple,
          ),
          SalomonBottomBarItem(
            icon: const Icon(LineIcons.user),
            title: const Text("Profile"),
            selectedColor: purple,
          ),
        ],
      ),
    );
  }
}

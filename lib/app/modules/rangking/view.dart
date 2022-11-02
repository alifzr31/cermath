import 'package:cermath/app/core/value/colors.dart';
import 'package:cermath/app/modules/dashboard/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class RankingPage extends StatelessWidget {
  final dashboardCtrl = Get.find<DashboardController>();
  RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purple,
        centerTitle: true,
        toolbarHeight: 141,
        flexibleSpace: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 45,
                    ),
                    const Text(
                      'Leaderboard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    CircleAvatar(
                      radius: 17,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          LineIcons.userPlus,
                          color: orange,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        LineIcons.user,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dashboardCtrl.user.value == null
                              ? ""
                              : dashboardCtrl.user.value!.username,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            '4500 Exp',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}

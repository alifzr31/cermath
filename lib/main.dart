import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

import 'package:cermath/app/core/utils/my_http_overrides.dart';
import 'package:cermath/app/routes/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'cerMath',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'OpenSans',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/intro',
      getPages: AppPages.pages,
    );
  }
}

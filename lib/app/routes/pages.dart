import 'package:cermath/app/modules/dashboard/binding.dart';
import 'package:cermath/app/modules/dashboard/view.dart';
import 'package:cermath/app/modules/hasil/binding.dart';
import 'package:cermath/app/modules/hasil/view.dart';
import 'package:cermath/app/modules/informasi/binding.dart';
import 'package:cermath/app/modules/informasi/view.dart';
import 'package:cermath/app/modules/intro/binding.dart';
import 'package:cermath/app/modules/intro/view.dart';
import 'package:cermath/app/modules/profile_update/binding.dart';
import 'package:cermath/app/modules/profile_update/view.dart';
import 'package:cermath/app/modules/list_soal/binding.dart';
import 'package:cermath/app/modules/list_soal/view.dart';
import 'package:cermath/app/modules/soal/binding.dart';
import 'package:cermath/app/modules/soal/view.dart';
import 'package:cermath/app/modules/submateri/binding.dart';
import 'package:cermath/app/modules/submateri/view.dart';
import 'package:cermath/app/modules/signin/binding.dart';
import 'package:cermath/app/modules/signin/view.dart';
import 'package:cermath/app/modules/signup/binding.dart';
import 'package:cermath/app/modules/signup/view.dart';
import 'package:cermath/app/routes/routes.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INTRO,
      page: () => IntroPage(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: Routes.SIGNIN,
      page: () => SigninPage(),
      binding: SigninBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignupPage(),
      binding: SignupBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.INFORMASI,
      page: () => InformasiPage(),
      binding: InformasiBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.downToUp,
    ),
    GetPage(
      name: Routes.SUBMATERI,
      page: () => SubMateriPage(),
      binding: SubMateriBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.LISTSOAL,
      page: () => ListSoalPage(),
      binding: QuestionListBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.SOAL,
      page: () => SoalPage(),
      binding: SoalBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.HASIL,
      page: () => HasilPage(),
      binding: HasilBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: Routes.EDITPROFILE,
      page: () => ProfileUpdatePage(),
      binding: ProfileUpdateBinding(),
      transition: Transition.cupertino,
    )
  ];
}

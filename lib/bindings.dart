import 'package:admin/controller/auth/sign_up_controller.dart';
import 'package:admin/controller/forget/forget_password_controller.dart';
import 'package:admin/core/class/crud.dart';
import 'package:admin/presentation/pages/auth/verify_code/verify_code_signup.dart';
import 'package:get/get.dart';

import 'controller/auth/sign_in_controller.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImpl(),fenix: true);
    Get.lazyPut(() => LoginControllerImpl(),fenix: true);
   Get.lazyPut(() => const VerifyCodeSignUpPage(),fenix: true);
   Get.lazyPut(() => CRUD(),fenix: true);
  }

}
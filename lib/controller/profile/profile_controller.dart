import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../../core/constants/routes.dart';
import '../../core/services/services.dart';

class ProfileController extends GetxController {
  AppServices appServices = Get.find();
  String? email;
  String? username;
  String? phone;

  getInformationOfAdmin() {
    email = appServices.sharedPreferences.getString("email");
    username = appServices.sharedPreferences.getString("username");
    phone = appServices.sharedPreferences.getString("phone");
  }

  logOut() {
    String adminID = appServices.sharedPreferences.getInt('id').toString();
    FirebaseMessaging.instance.unsubscribeFromTopic("admin");
    FirebaseMessaging.instance.unsubscribeFromTopic("admin$adminID");
    appServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onInit() {
    getInformationOfAdmin();
    super.onInit();
  }

  goToUsers() {
    Get.toNamed(AppRoutes.users);
  }

  goToStatistic() {
    Get.toNamed(AppRoutes.statistic);
  }

  String getInitials({required String string, required int limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    for (var i = 0; i < (limitTo); i++) {
      buffer.write(split[i][0]);
    }
    return buffer.toString();
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../core/services/services.dart';
import '../../data/data_source/remote/auth/login_remote_datasource.dart';
abstract class LoginController extends GetxController{
login();
goToForgetPassword();

}
class LoginControllerImpl extends LoginController{
  late TextEditingController emailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formLogin = GlobalKey<FormState>();
  LoginRemoteDataSource loginRemoteDataSource = LoginRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  AppServices appServices = Get.find();
  @override
  login() async{
   var formData = formLogin.currentState!.validate();
   if(formData){
     statusRequest  = StatusRequest.loading;
     update();
     var response = await loginRemoteDataSource.postData(emailController.text,passwordController.text);
     statusRequest = handlingData(response);
     print("------------------------------------------------------------------------ Controller $response");
     print(response);
     if(StatusRequest.success == statusRequest){
       if(response['status']=="success") {
        if(response['data']['approve'] == '0'){
          Get.toNamed(AppRoutes.verifyCode,arguments: {
            "email":emailController.text
          });
        }else{
          appServices.sharedPreferences.setInt("id", response['data']['admin_id']);
          String adminID = appServices.sharedPreferences.getInt("id").toString();
          appServices.sharedPreferences.setString("username", response['data']['admin_username']);
          appServices.sharedPreferences.setString("email", response['data']['admin_email']);
          appServices.sharedPreferences.setString("phone",response['data']['admin_phone']);
          appServices.sharedPreferences.setString("step","2");
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("admin$adminID");
          print("users ID is $adminID");
          Get.offNamed(AppRoutes.main);
        }
       }else{
         Get.defaultDialog(title: "warning",middleText: "email or password are incorrect");
         statusRequest = StatusRequest.failure;
       }
     }
     update();
     print("valid");
   }else{
     print("not valid");
   }
  }

 @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
    });
    super.onInit();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoutes.forgetPassword);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

}

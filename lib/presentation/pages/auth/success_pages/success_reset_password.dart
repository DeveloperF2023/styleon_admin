import 'package:admin/presentation/widgets/auth/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/localization/change_local.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../widgets/global/text_app.dart';

class SuccessResetPassword extends GetView<LocaleController>{
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/success.json",height: 300,width: 300),
          sizeVertical(20),
           TextApp(text: "30".tr,fontSize: 25,color: Colors.black54,fontWeight: FontWeight.w700,textAlign: TextAlign.center,),
          sizeVertical(20),
           ButtonWidget(text: "31".tr),

        ],
      )),
    );
  }
}

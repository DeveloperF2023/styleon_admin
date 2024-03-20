import 'package:enefty_icons/enefty_icons.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/presentation/widgets/auth/background_image.dart';
import 'package:admin/presentation/widgets/auth/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forget/reset_password_controller.dart';
import '../../../../core/class/handling_dataview.dart';
import '../../../../core/localization/change_local.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/strings.dart';
import '../../../widgets/global/form_container.dart';
import '../../../widgets/global/text_app.dart';


class ResetPasswordPage  extends GetView<LocaleController> {
  const ResetPasswordPage({super.key, this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImpl());
    return Scaffold(
      body: GetBuilder<ResetPasswordControllerImpl>(builder: (controller){
        return HandlingDataRequest(statusRequest: controller.statusRequest,widget: Stack(
          children: [
            const BackgroundImage(),
            Positioned(
                bottom: MediaQuery.of(context).size.height*.15,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: MediaQuery.of(context).size.height*.45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Form(
                        key: controller.formKeyReset,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                                onTap: (){
                                  controller.goToVerifyCode();
                                },
                                child: Container(
                                    height: 38,
                                    width: 38,
                                    decoration: const BoxDecoration(
                                        color: Colors.white30,
                                        shape: BoxShape.circle
                                    ),
                                    child: const Center(child: Icon(Icons.arrow_back,color: Colors.white,size: 20,)))),
                            sizeVertical(5),
                            TextApp(text: "18".tr,color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),
                            sizeVertical(5),
                            TextApp(text:"19".tr,color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17,),
                            sizeVertical(15),
                            FormContainer(hintText: "25".tr,prefixIcon: EneftyIcons.lock_outline,controller: controller.passwordController,isPasswordField: true,validator: (val){
                              val == "" ? "Password is required":null;
                            },),
                            sizeVertical(10),
                            FormContainer(hintText: "28".tr,prefixIcon: EneftyIcons.lock_outline,controller: controller.confirmPasswordController,isPasswordField: true,validator: (val){
                              val == "" ? " Confirm Password is required":null;
                            },),
                            sizeVertical(10),
                            sizeVertical(10),
                            ButtonWidget(text: "29".tr,onTap: (){
                              controller.resetPassword();
                            })
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),);

      }),

          );
  }
}

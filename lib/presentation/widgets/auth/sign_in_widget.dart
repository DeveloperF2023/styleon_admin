import 'package:enefty_icons/enefty_icons.dart';
import 'package:admin/presentation/widgets/auth/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../core/functions/validator_input.dart';
import '../../../core/localization/change_local.dart';
import '../../../core/constants/app_constants.dart';
import '../global/form_container.dart';
import '../global/text_app.dart';


class SignInWidget extends GetView<LocaleController>{
  const SignInWidget({super.key, required this.emailController, required this.passwordController, this.onPressedPassword, this.onTap,required this.formKey});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function()? onPressedPassword;
  final Function()? onTap;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
         TextApp(text: "2".tr,color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),
        sizeVertical(5),
         TextApp(text: "3".tr,color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17,),
        sizeVertical(15),
        Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FormContainer(hintText: "24".tr,prefixIcon: EneftyIcons.message_2_outline,controller: emailController,validator: (val){
                  return validateInput(val!, 5, 100, "email");
                },isPrefix: true,),
                sizeVertical(10),
                FormContainer(hintText: "25".tr,prefixIcon: EneftyIcons.lock_outline,controller: passwordController,isPasswordField: true,validator: (val){
                  return validateInput(val!, 5, 16, "password");
                },),
                sizeVertical(10),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: onPressedPassword,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextApp(text: "13".tr,fontSize: 15,fontWeight: FontWeight.w400,color: AppColors.subtitleColor,),
                      ],
                    ),
                  ),
                ),
                sizeVertical(30),
                ButtonWidget(text: "12".tr,onTap: onTap,),
                sizeVertical(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextApp(text: "9".tr,fontSize: 16,fontWeight: FontWeight.w400,color: AppColors.subtitleColor,),
                      sizeHorizontal(5),
                      GestureDetector(
                          onTap: (){

                          },
                          child:  TextApp(text: "10".tr,fontSize: 18,fontWeight: FontWeight.bold,color:AppColors.primaryColor)),
                    ],
                  ),
                ),
              ],
            ))
      ],
    );
  }
}

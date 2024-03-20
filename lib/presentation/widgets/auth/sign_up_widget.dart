import 'package:enefty_icons/enefty_icons.dart';
import 'package:admin/core/functions/validator_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/constants/colors.dart';
import '../../../core/localization/change_local.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/strings.dart';
import '../global/form_container.dart';
import '../global/text_app.dart';
import 'button_widget.dart';


class SignUpWidget extends GetView<LocaleController>{
  const SignUpWidget({super.key, required this.emailController, required this.passwordController, required this.phoneController, required this.nameController, this.onTap,required this.formKey});
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final TextEditingController nameController;
  final Function()? onTap;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        TextApp(text: "5".tr,color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),
        sizeVertical(5),
        TextApp(text: "7".tr,color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17,),
        sizeVertical(15),
        Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FormContainer(hintText: "26".tr,prefixIcon: EneftyIcons.profile_outline,controller: nameController,isFilled: true,validator: (val){
                  return validateInput(val!, 5, 16, "username");
                },),
                sizeVertical(10),
                FormContainer(hintText: "24".tr,prefixIcon: EneftyIcons.message_2_outline,controller: emailController,validator: (val){
                  return validateInput(val!, 5, 100, "email");
                },),
                sizeVertical(10),
                FormContainer(hintText: "27".tr,prefixIcon: EneftyIcons.call_bold,controller: phoneController,validator: (val){
                  return validateInput(val!, 10, 14, "phone");
                },type: TextInputType.number,),
                sizeVertical(10),
                FormContainer(hintText: "25".tr,prefixIcon: EneftyIcons.lock_outline,controller: passwordController,isPasswordField: true,validator: (val){
                  return validateInput(val!, 6, 20, "password");
                },),

                sizeVertical(15),
                ButtonWidget(text: "11".tr,onTap: onTap,),


              ],
            ))
      ],
    );
  }
}

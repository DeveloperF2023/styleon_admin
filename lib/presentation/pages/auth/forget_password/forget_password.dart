import 'package:enefty_icons/enefty_icons.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/core/functions/validator_input.dart';
import 'package:admin/presentation/widgets/auth/background_image.dart';
import 'package:admin/presentation/widgets/auth/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forget/forget_password_controller.dart';
import '../../../../core/class/handling_dataview.dart';
import '../../../../core/localization/change_local.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../widgets/global/form_container.dart';
import '../../../widgets/global/text_app.dart';


class ForgetPasswordPage extends GetView<LocaleController>{
  const ForgetPasswordPage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => ForgetPasswordControllerImpl(),fenix: true);
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImpl>(builder: (controller){
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
                    height: MediaQuery.of(context).size.height*.38,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: Form(
                          key: controller.formKeyForget,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    controller.goToAuth();
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
                              TextApp(text: '16'.tr,color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,),
                              sizeVertical(5),
                              TextApp(text: '17'.tr,color: Colors.white,fontWeight: FontWeight.w500,fontSize: 17,),
                              sizeVertical(15),
                              FormContainer(hintText: "Email",prefixIcon: EneftyIcons.message_2_outline,controller: controller.emailController,validator: (val){
                                return validateInput(val!, 5, 100, "email");
                              },),
                              sizeVertical(20),
                              ButtonWidget(text: '29'.tr,onTap: (){controller.checkEmail();})
                            ],
                          )),
                    ),
                  ),
                )),
          ],
        ));

      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:admin/core/constants/dimensions.dart';

import '../../../controller/onboarding_controller/onboarding_controller.dart';
import '../../../data/data_source/static/static.dart';
import '../../pages/auth/authentication.dart';
import '../global/text_app.dart';

class CustomButtonOnboarding extends GetView<OnboardingControllerImpl>{
  const CustomButtonOnboarding({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        controller.next();
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width20,vertical: height20),
        child: Container(
         width: double.infinity,
         decoration: BoxDecoration(
           color:Colors.white,
           borderRadius: BorderRadius.circular(radius10)
         ),
         child: Center(
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: width10,vertical: height10),
             child:TextApp(text:'Next', color: Colors.black,fontSize: font18,fontWeight: FontWeight.bold,),
           ),
         ),
        ),
      ),
    );
  }
}

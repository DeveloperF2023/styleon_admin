import 'package:admin/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';

import '../../../controller/onboarding_controller/onboarding_controller.dart';
import '../../../core/constants/colors.dart';
import '../../../data/data_source/static/static.dart';
import 'button_onboarding.dart';
import 'dots_indicator.dart';

class CustomSliderOnboarding extends GetView<OnboardingControllerImpl>{
  const CustomSliderOnboarding(this.currentIndex, {super.key});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      itemCount: contents.length,
      onPageChanged: (int index) {
       controller.onPageChanged(index);
      },
      itemBuilder: (_, i) {
        return Stack(
          children: [
            Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(contents[i].image!))
              ),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: screenHeight,
                  width: screenWidth,
                  color: Colors.black38,
                )),
            Positioned(
                top: height42,
                left: width10,
                child: TextApp(text: "SKIP",fontSize: font16,fontWeight: FontWeight.w500,color: Colors.white,decoration: TextDecoration.underline,decorationColor: Colors.white,decorationThickness: 2,)),
            Positioned(
                top: height42*2.5,
                left: width10,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     // TextApp(text: contents[i].title!,color: AppColors.white,fontSize: font25*2.5,fontWeight: FontWeight.w700,),
                      Text(contents[i].title!,style: TextStyle(
                        fontFamily: "Playfair",
                        fontSize: font25*2.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      ),),
                      TextApp(text: contents[i].description!,color: AppColors.white,fontSize: font18,fontWeight: FontWeight.w500,),
                    ],
                  ),
                )),

          ],
        );
      },
    );
  }
}

import 'package:admin/controller/onboarding_controller/onboarding_controller.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/pages/auth/authentication.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../data/data_source/static/static.dart';
import '../../../core/constants/app_constants.dart';
import '../../widgets/onboarding/button_onboarding.dart';
import '../../widgets/onboarding/custom_slider_onboarding.dart';
import '../../widgets/onboarding/dots_indicator.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImpl());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          CustomSliderOnboarding(currentIndex),
          Positioned(
            bottom: height10,
            left: 0,
            right: 0,
            child: const CustomButtonOnboarding(),),
          Positioned(
            bottom: height10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                        (index) => DotsIndicator(index: index),
                  ),
                ),
              ],
            ),),

        ],
      ),
    )
    ;
  }

}
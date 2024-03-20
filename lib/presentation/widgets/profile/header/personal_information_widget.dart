import 'package:admin/controller/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class PersonalInformationWidget extends GetView<ProfileController> {
  const PersonalInformationWidget(
      {super.key, required this.username, required this.email});
  final String username;
  final String email;
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width10, vertical: height10 * 1.3),
        child: Row(
          children: [
            Container(
              height: height42 * 1.5,
              width: width42 * 1.5,
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor, shape: BoxShape.circle),
              child: Center(
                  child: TextApp(
                text: controller.getInitials(
                    string: controller.username!.toUpperCase(), limitTo: 1),
                fontSize: font25,
                color: AppColors.white,
              )),
            ),
            sizeHorizontal(width10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: username,
                  fontSize: font25,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
                TextApp(
                  text: email,
                  fontSize: font14,
                  color: AppColors.textColor!.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

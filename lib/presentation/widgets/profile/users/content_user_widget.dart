import 'package:admin/data/model/users_model.dart';
import 'package:admin/presentation/widgets/global/container_substring_username.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../controller/profile/tiles/users/users_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';

class ContentOfUserWidget extends GetView<UsersProfileController> {
  final UsersModel usersModel;
  const ContentOfUserWidget({super.key, required this.usersModel});

  @override
  Widget build(BuildContext context) {
    Get.put(UsersProfileController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10, vertical: height5),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300, width: 1),
            borderRadius: BorderRadius.circular(radius10)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height5),
          child: ListTile(
            leading: ContainerOfSubstringUsername(
                username: controller.getInitials(
                    string: usersModel.username!.toUpperCase(), limitTo: 1)),
            title: TextApp(
              text: usersModel.username!,
              color: AppColors.textColor,
              fontSize: font18,
              fontWeight: FontWeight.bold,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: usersModel.email!,
                  color: AppColors.grey600,
                  fontSize: font14,
                  fontWeight: FontWeight.w400,
                ),
                InkWell(
                  onTap: () async {
                    await launchUrl(Uri.parse("tel:${usersModel.phone}"));
                  },
                  child: TextApp(
                    text: usersModel.phone!,
                    color: AppColors.green,
                    fontSize: font14,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationThickness: 1,
                    decorationColor: AppColors.subtitleColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

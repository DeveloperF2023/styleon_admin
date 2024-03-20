import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:admin/presentation/widgets/users/historic_users/body/user_information_section/username_substring_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderUserInformation extends StatelessWidget {
  const HeaderUserInformation({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .08,
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.textColor,
                  size: font22,
                )),
            TextApp(
              text: "User's Detail",
              color: AppColors.textColor,
              fontSize: font18,
              fontWeight: FontWeight.bold,
            ),
            UsernameSubstringWidget(
              username: username,
              height: height42,
              width: width42,
              size: font20,
            )
          ],
        ),
      ),
    );
  }
}

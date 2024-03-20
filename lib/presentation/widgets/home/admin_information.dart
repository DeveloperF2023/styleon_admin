import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';

class AdminInformation extends StatelessWidget {
  const AdminInformation(
      {super.key, required this.substring_username, required this.username});
  final String substring_username;
  final String username;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.r),
            bottomLeft: Radius.circular(30.r),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: height15),
        child: Row(
          children: [
            Container(
              height: 42.h,
              width: 42.w,
              margin: EdgeInsets.only(left: width10),
              decoration: const BoxDecoration(
                  color: AppColors.primaryColor, shape: BoxShape.circle),
              child: Center(
                  child: TextApp(
                text: substring_username,
                fontSize: 25.sp,
                color: AppColors.white,
              )),
            ),
            sizeHorizontal(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: username.toUpperCase(),
                  color: AppColors.textColor,
                ),
                TextApp(
                  text: "👋 Hello",
                  color: AppColors.textColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

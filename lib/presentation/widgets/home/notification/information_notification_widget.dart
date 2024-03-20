import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class InformationOfNotificationWidget extends StatelessWidget {
  const InformationOfNotificationWidget(
      {super.key, required this.notificationInfo, required this.icon});
  final String notificationInfo;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: font18,
          color: AppColors.primaryColor,
        ),
        sizeHorizontal(width10),
        SizedBox(
            width: screenWidth * .55,
            child: TextApp(
              text: notificationInfo,
              fontSize: font12,
              color: AppColors.textColor,
            )),
      ],
    );
  }
}

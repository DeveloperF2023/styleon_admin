import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class InformationOfDeliveryWidget extends StatelessWidget {
  const InformationOfDeliveryWidget({super.key, required this.deliveryInfo,required this.icon});
  final String deliveryInfo;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: font16,
          color: AppColors.subtitleColor,
        ),
        sizeHorizontal(width5),
        TextApp(
          text: deliveryInfo,
          fontSize: 12,
          color: AppColors.textColor,

        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';
import '../../global/container_colored_status.dart';

class SingleStatisticOrder extends StatelessWidget {
  const SingleStatisticOrder({super.key, required this.color, required this.text, required this.countPending});
  final Color color;
  final String text;
  final int countPending;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ContainerOfColoredStatus(color: color,),
            sizeHorizontal(width10),
            TextApp(text: text,fontSize: font16,color: AppColors.grey600,),
          ],
        ),
        TextApp(text: countPending.toString(),fontSize: font18,color: AppColors.textColor,fontWeight: FontWeight.w500,)
      ],
    );
  }
}

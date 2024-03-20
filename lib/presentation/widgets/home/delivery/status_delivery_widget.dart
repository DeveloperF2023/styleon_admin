import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class StatusOfDelivery extends StatelessWidget {
  const StatusOfDelivery({super.key, required this.status});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.verified,size: font12,color: AppColors.white,),
        sizeHorizontal(width3),
         TextApp(
          text: status,
          color: AppColors.white,
          fontSize: 10,
        ),
      ],
    );
  }
}

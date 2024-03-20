import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class HeaderOfChart extends StatelessWidget {
  const HeaderOfChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width15,vertical: height10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextApp(text: "Products",fontSize: font18,
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,),
          sizeVertical(height5),
          Row(
            children: [
              Icon(Icons.circle,size: font14,color: const Color(0xff7b4af5),),
              sizeHorizontal(width3),
              TextApp(text: "Online",fontSize: font12,color: AppColors.textColor,)
            ],
          ),
        ],
      ),
    );
  }
}

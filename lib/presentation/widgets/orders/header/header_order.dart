import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class HeaderOrder extends StatelessWidget {
  const HeaderOrder(
      {super.key,
        required this.ordersLength,
        required this.text,
      });
  final int ordersLength;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10, vertical: height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextApp(
            text: "$text ${ordersLength.toString()}",
            fontSize: font12,
            color: AppColors.subtitleColor,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

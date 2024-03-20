import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class CallWidget extends StatelessWidget {
  const CallWidget({super.key, required this.deliveryPhone});
  final String deliveryPhone;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ()async{
        await launchUrl(Uri.parse("tel:$deliveryPhone"));
      },
      child: TextApp(
        text: "Call",
        fontSize: font12,
        color: AppColors.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.green,
        decorationThickness: 1.5,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

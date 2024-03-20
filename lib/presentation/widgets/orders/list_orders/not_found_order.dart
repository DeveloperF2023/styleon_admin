import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/core/constants/image_assets.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';

class NotFoundOrder extends StatelessWidget {
  final String notFoundText;
  const NotFoundOrder({super.key, required this.notFoundText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImageAssets.notFoundOrder),
          sizeVertical(height20),
          TextApp(
            text: "$notFoundText does not exist\n please try again",
            textAlign: TextAlign.center,
            color: Colors.grey.shade500,
          )
        ],
      ),
    );
  }
}

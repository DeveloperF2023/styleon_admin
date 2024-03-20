import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection(
      {super.key,
      required this.productsLength,
      required this.text,
        this.textButton,
        this.isShow = true, this.onPressed});
  final int productsLength;
  final String text;
  final String? textButton;
  final bool isShow;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10, vertical: height10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextApp(
            text: "$text ${productsLength.toString()}",
            fontSize: font12,
            color: const Color(0xff898fac),
            fontWeight: FontWeight.w500,
          ),
         isShow == true ? TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: AppColors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius5))),
              onPressed: onPressed,
              child: TextApp(
                text: textButton!,
                fontSize: font14,
                color: AppColors.white,
              )):Container(),
        ],
      ),
    );
  }
}

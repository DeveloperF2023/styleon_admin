import 'package:admin/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ManageButtonWidget extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final void Function() onPressed;
  const ManageButtonWidget(
      {super.key,
      required this.icon,
      required this.backgroundColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(radius5)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width5, vertical: height5),
          child: Icon(
            icon,
            color: AppColors.white,
            size: font16,
          ),
        ),
      ),
    );
  }
}

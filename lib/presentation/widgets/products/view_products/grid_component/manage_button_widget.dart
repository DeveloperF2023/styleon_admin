import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';

class ManagementButtonWidget extends StatelessWidget {
  const ManagementButtonWidget(
      {super.key,
      required this.icon,
      required this.color,
      required this.iconColor,
      this.onTap});
  final IconData icon;
  final Color color;
  final Color iconColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height32,
        width: width32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius5), color: color),
        child: Center(
          child: Icon(
            icon,
            color: iconColor,
            size: font18,
          ),
        ),
      ),
    );
  }
}

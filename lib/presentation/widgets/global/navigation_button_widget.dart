import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';


class NavigationButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String textButton;
  final IconData icon;
  const NavigationButtonWidget({
    super.key, this.onPressed, required this.textButton, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
          style: TextButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              iconColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius5)
              )
          ),
          onPressed:onPressed, icon: Icon(icon), label: TextApp(text: textButton,fontSize: font16,color: AppColors.white,)),
    );
  }
}
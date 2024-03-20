import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';

class TextFieldOfManagePages extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? type;
  final String? Function(String?)? validator;
  const TextFieldOfManagePages(
      {super.key, this.controller, this.type, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      cursorColor: AppColors.primaryColor,
      validator: validator,
      maxLines: null,
      style: TextStyle(
          fontSize: font12,
          fontFamily: "Poppins",
          color: AppColors.textColor!.withOpacity(0.7),
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        contentPadding: const EdgeInsets.only(top: 20, left: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius5)),
          borderSide: BorderSide(width: 1.5, color: AppColors.subtitleColor!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius5)),
          borderSide: BorderSide(width: 1.5, color: AppColors.subtitleColor!),
        ),
      ),
    );
  }
}

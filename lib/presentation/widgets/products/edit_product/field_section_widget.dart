import 'package:admin/presentation/widgets/products/edit_product/text_field_edit_product.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class FieldSectionWidget extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final bool? isExpanded;
  final String? Function(String?)? validator;
  const FieldSectionWidget({
    super.key,
    required this.controller,
    required this.title,
    this.isExpanded = true,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded == true
        ? Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: title,
                  fontSize: font12,
                  color: AppColors.textColor,
                ),
                sizeVertical(height5),
                TextFieldOfManagePages(
                  controller: controller,
                  validator: validator,
                ),
              ],
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: title,
                fontSize: font12,
                color: AppColors.textColor,
              ),
              sizeVertical(height5),
              TextFieldOfManagePages(
                controller: controller,
                validator: validator,
              ),
            ],
          );
  }
}

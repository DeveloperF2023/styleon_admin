import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class CategoriesInformationWidget extends StatelessWidget {
  const CategoriesInformationWidget({super.key, required this.categoryDate, required this.categoryName});
  final String categoryDate;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: categoryName,
          fontSize: font14,
          fontWeight: FontWeight.w400,
          color: Colors.grey[700],
        ),
        TextApp(
          text: categoryDate,
          fontSize: font12,
          fontWeight: FontWeight.w600,
          color: AppColors.subtitleColor,
        ),
      ],
    );
  }
}

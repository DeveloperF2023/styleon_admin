import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.categoryName});
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius5), color: AppColors.green),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width3, vertical: height3),
        child: TextApp(
          text: categoryName,
          fontSize: 10,
          color: AppColors.white,
        ),
      ),
    );
  }
}

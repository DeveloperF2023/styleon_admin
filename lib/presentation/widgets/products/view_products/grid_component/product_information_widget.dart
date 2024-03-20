import 'package:admin/core/constants/text_substring.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../global/text_app.dart';

class ProductInformationWidget extends StatelessWidget {
  const ProductInformationWidget(
      {super.key, required this.countPrice, required this.productName});
  final String countPrice;
  final String productName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextApp(
          text: countPrice,
          fontSize: font16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
        TextApp(
          text: productName.intelliTrim(),
          fontSize: font12,
          fontWeight: FontWeight.w400,
          color: Colors.grey[700],
        ),
      ],
    );
  }
}

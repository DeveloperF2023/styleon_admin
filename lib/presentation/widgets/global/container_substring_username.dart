import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';

class ContainerOfSubstringUsername extends StatelessWidget {
  const ContainerOfSubstringUsername({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height42 * 1.5,
      width: width42 * 1.5,
      decoration: const BoxDecoration(
          color: AppColors.primaryColor, shape: BoxShape.circle),
      child: Center(
          child: TextApp(
        text: username,
        fontSize: font25,
        color: AppColors.white,
      )),
    );
  }
}

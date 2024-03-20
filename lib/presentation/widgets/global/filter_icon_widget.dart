import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';

class FilterIconWidget extends StatelessWidget {
  final void Function() onPressed;
  const FilterIconWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth * .1,
      child: IconButton(
          style: IconButton.styleFrom(
              backgroundColor: AppColors.fillColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius5))),
          onPressed: onPressed,
          icon: const Icon(
            Icons.filter_list_outlined,
            color: Color(0xff898fac),
          )),
    );
  }
}

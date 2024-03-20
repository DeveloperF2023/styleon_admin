import 'package:admin/controller/products/view_products_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';

class FilterListOfProductWidget extends GetView<ViewProductController> {
  const FilterListOfProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ViewProductController());
    return ListView.builder(
      itemCount: controller.dropItems.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(right: width3, top: height10),
          child: ChoiceChip(
            label: Text(
              controller.dropItems[index],
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: font12,
                  color: controller.choiceIndex == index
                      ? Colors.white
                      : Color(0xff898fac)),
            ),
            selected: controller.choiceIndex == index,
            selectedColor: AppColors.green,
            checkmarkColor: AppColors.white,
            onSelected: (value) {
              controller.onSelectedChoiceFilter(value, index);
            },
            backgroundColor: AppColors.white,
          ),
        );
      },
    );
  }
}

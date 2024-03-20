import 'package:admin/controller/home/products/products_controller.dart';
import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';

class CardOfMyShop extends GetView<HomeProductsController> {
  const CardOfMyShop(
      {super.key,
      required this.color,
      required this.text,
      required this.value});
  final Color color;
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(screenHeight * .16),
      //width: ScreenUtil().setWidth(screenHeight * .17),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius10)),
      child: Padding(
        padding:
            EdgeInsets.only(left: 15.w, top: 20.h, bottom: 20.h, right: 48.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          //mainAxisSize: MainAxisSize.min,
          children: [
            TextApp(
              text: text,
              fontSize: font12,
              color: AppColors.white,
            ),
            sizeVertical(height20),
            TextApp(
              text: value,
              fontSize: font25 * 1.2,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_upward,
                    size: font12,
                    color: AppColors.white,
                  ),
                  sizeHorizontal(width5),
                  TextApp(
                    text: "Last update",
                    fontSize: font12,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

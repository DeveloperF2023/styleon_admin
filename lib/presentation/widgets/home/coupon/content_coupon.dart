import 'package:admin/controller/home/home_controller.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/coupon_model.dart';
import 'package:admin/presentation/widgets/home/coupon/coupon_discount_widget.dart';
import 'package:admin/presentation/widgets/home/coupon/coupon_name_widget.dart';
import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ContentOfCoupon extends GetView<HomeControllerImpl> {
  final CouponModel couponModel;
  final List colors;
  final int index;
  const ContentOfCoupon({super.key, required this.couponModel, required this.colors, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: width10),
      child: Container(
        width: screenWidth*.35,
        decoration: BoxDecoration(
          color: colors[index % controller.couponsController.colors.length].withOpacity(0.1),
          borderRadius: BorderRadius.circular(radius10)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CouponNameWidget(couponName: "${couponModel.couponName}"),
              CouponDiscountWidget(couponDiscount: "${couponModel.couponDiscount}%", totalCoupon: "${couponModel.couponCount}", color: colors[index % controller.couponsController.colors.length],),
            ],
          ),
        ),
      ),
    );
  }
}

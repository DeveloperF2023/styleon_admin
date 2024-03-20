import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/coupon_model.dart';
import 'coupon_discount_widget.dart';
import 'coupon_name_widget.dart';


class SearchOfCouponList extends GetView<HomeControllerImpl> {
  final List<CouponModel> couponList;
  final List colors;
  const SearchOfCouponList({super.key, required this.couponList,required this.colors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .21,
      width: double.infinity,
      child: ListView.builder(
          itemCount: couponList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
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
                    CouponNameWidget(couponName: "${couponList[index].couponName}"),
                    CouponDiscountWidget(couponDiscount: "${couponList[index].couponDiscount}%", totalCoupon: "${couponList[index].couponCount}", color: colors[index % controller.couponsController.colors.length],),
                  ],
                ),
              ),
            ),
          );
      }),
    );
  }
}

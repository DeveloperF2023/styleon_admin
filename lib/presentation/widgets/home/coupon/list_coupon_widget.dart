import 'package:admin/data/model/coupon_model.dart';
import 'package:admin/presentation/widgets/home/coupon/search_coupon_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../header_of_section.dart';
import 'content_coupon.dart';

class CouponListView extends GetView<HomeControllerImpl> {
  const CouponListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width5),
        child: Card(
          surfaceTintColor: AppColors.textColor,
          color: AppColors.textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius10)),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: Colors.grey.shade200, width: 2),
                borderRadius: BorderRadius.circular(radius10)),
            child: Padding(
              padding: EdgeInsets.only(bottom: height20),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height20, horizontal: width10),
                    child: HeaderOfSection(
                      isPadding: true,
                      searchController: controller.searchCouponController,
                      onChanged: (value) {
                        controller.checkValueCoupon(value);
                      },
                      onSearch: controller.onSearchCoupon,
                      textSection: 'Coupon List',
                    ),
                  ),
                  Container(
                    height: screenHeight * .11,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width10),
                      child: !controller.isSearchCoupon
                          ? ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.coupon.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ContentOfCoupon(
                                  couponModel: CouponModel.fromJson(
                                      controller.coupon[index]),
                                  colors: controller.couponsController.colors,
                                  index: index,
                                );
                              })
                          : SearchOfCouponList(
                              couponList: controller.couponList,
                              colors: controller.couponsController.colors,
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

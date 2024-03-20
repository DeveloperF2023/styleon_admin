import 'package:admin/controller/home/home_controller.dart';
import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import 'card_my_shop.dart';

class StatisticWidget extends GetView<HomeControllerImpl> {
  const StatisticWidget({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());

    /// Products Management

    final lastMonthProductsTest =
        controller.productsController.products.where((product) {
      final now = DateTime.now();
      final lastMonth = DateTime(now.year, now.month - 1, now.day);
      return product.createdAtProduct!.isAfter(lastMonth);
    }).toList();
    int totalProductsOfMonth = lastMonthProductsTest.length;

    final lastTwoWeeksProducts =
        controller.productsController.products.where((product) {
      final now = DateTime.now();
      final twoWeeksAgo = now.subtract(Duration(days: 14));
      return product.createdAtProduct!.isAfter(twoWeeksAgo);
    }).toList();
    int totalProductOfLastTwoWeek = lastTwoWeeksProducts.length;

    ///last week
    final lastWeeksProducts =
        controller.productsController.products.where((product) {
      final now = DateTime.now();
      final twoWeeksAgo = now.subtract(const Duration(days: 7));
      return product.createdAtProduct!.isAfter(twoWeeksAgo);
    }).toList();
    int totalProductOfLastWeek = lastWeeksProducts.length;

    ///Categories Management

    final lastMonthCategoriesTest =
        controller.categoryController.categories.where((categories) {
      final now = DateTime.now();
      final lastMonth = DateTime(now.year, now.month - 1, now.day);
      return categories.createdAt!.isAfter(lastMonth);
    }).toList();
    int totalCategoriesOfMonth = lastMonthCategoriesTest.length;

    final lastTwoWeekCategories =
        controller.categoryController.categories.where((categories) {
      final now = DateTime.now();
      final twoWeeksAgo = now.subtract(Duration(days: 14));
      return categories.createdAt!.isAfter(twoWeeksAgo);
    }).toList();
    int totalOfLastTwoWeekOfCategories = lastTwoWeekCategories.length;

    final lastWeekCategories =
        controller.categoryController.categories.where((categories) {
      final now = DateTime.now();
      final weeksAgo = now.subtract(const Duration(days: 7));
      return categories.createdAt!.isAfter(weeksAgo);
    }).toList();
    int totalCategoriesOfLastWeek = lastWeekCategories.length;

    ///Users Management

    final lastMonthUsers = controller.usersController.users.where((users) {
      final now = DateTime.now();
      final lastMonth = DateTime(now.year, now.month - 1, now.day);
      return users.createdAt!.isAfter(lastMonth);
    }).toList();
    int totalLastMonthUsers = lastMonthUsers.length;

    final lastTwoWeekUsers = controller.usersController.users.where((users) {
      final now = DateTime.now();
      final twoWeeksAgo = now.subtract(const Duration(days: 14));
      return users.createdAt!.isAfter(twoWeeksAgo);
    }).toList();
    int totalOfLastTwoWeekUsersOfUsers = lastTwoWeekUsers.length;

    final lastWeekUsers =
        controller.categoryController.categories.where((categories) {
      final now = DateTime.now();
      final weeksAgo = now.subtract(const Duration(days: 7));
      return categories.createdAt!.isAfter(weeksAgo);
    }).toList();
    int totalLastWeekUsers = lastWeekUsers.length;

    ///Orders Management
    final lastMonthOrders =
        controller.orderController.orderModel.where((orders) {
      final now = DateTime.now();
      final lastMonth = DateTime(now.year, now.month - 1, now.day);
      return orders.ordersDate!.isAfter(lastMonth);
    }).toList();
    int totalLastMonthOrders = lastMonthOrders.length;

    final lastTwoWeekOrders =
        controller.orderController.orderModel.where((orders) {
      final now = DateTime.now();
      final twoWeeksAgo = now.subtract(const Duration(days: 14));
      return orders.ordersDate!.isAfter(twoWeeksAgo);
    }).toList();
    int totalOfLastTwoWeekOrders = lastTwoWeekOrders.length;

    final lastWeekOrders =
        controller.orderController.orderModel.where((orders) {
      final now = DateTime.now();
      final weeksAgo = now.subtract(const Duration(days: 7));
      return orders.ordersDate!.isAfter(weeksAgo);
    }).toList();
    int totalLastWeekOrders = lastWeekOrders.length;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Container(
          height: ScreenUtil().setHeight(screenHeight * .43),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200, width: 2),
              borderRadius: BorderRadius.circular(10.r)),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: width10, vertical: height10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: TextApp(
                        text: "Products Statistic",
                        fontSize: 18.sp,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 38.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey50!, width: 1),
                        color: const Color(0xfff8f9fe),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              icon: Icon(
                                Icons.date_range,
                                color: const Color(0xff898fac),
                                size: font22,
                              ),
                              value: controller.productsController.selectedItem,
                              items: controller.productsController.dropItems
                                  .map((product) => DropdownMenuItem<String>(
                                      value: product,
                                      child: TextApp(
                                        text: product,
                                        color: const Color(0xff898fac),
                                        fontSize: font14,
                                      )))
                                  .toList(),
                              onChanged: (value) {
                                controller.onChangedItem(value!);
                                print(value);
                              }),
                        ),
                      ),
                    )
                  ],
                ),
                sizeVertical(height10),
                Padding(
                  padding: EdgeInsets.only(left: width10),
                  child: Row(
                    children: [
                      if (controller.productsController.selectedItem == "All")
                        CardOfMyShop(
                          color: AppColors.green,
                          text: 'Products',
                          value: controller.productsController.products.length
                              .toString(),
                        ),
                      if (controller.productsController.selectedItem == "Month")
                        CardOfMyShop(
                          color: AppColors.green,
                          text: 'Products',
                          value: totalProductsOfMonth.toString(),
                        ),
                      if (controller.productsController.selectedItem ==
                          "2 Week")
                        CardOfMyShop(
                          color: AppColors.green,
                          text: 'Products',
                          value: totalProductOfLastTwoWeek.toString(),
                        ),
                      if (controller.productsController.selectedItem == "Week")
                        CardOfMyShop(
                          color: AppColors.green,
                          text: 'Products',
                          value: totalProductOfLastWeek.toString(),
                        ),
                      sizeHorizontal(width15),
                      if (controller.productsController.selectedItem == "All")
                        CardOfMyShop(
                          color: const Color(0xffc53be8),
                          text: 'Categories',
                          value: controller.categoryController.categories.length
                              .toString(),
                        ),
                      if (controller.productsController.selectedItem == "Month")
                        CardOfMyShop(
                          color: const Color(0xffc53be8),
                          text: 'Categories',
                          value: totalCategoriesOfMonth.toString(),
                        ),
                      if (controller.productsController.selectedItem ==
                          "2 Week")
                        CardOfMyShop(
                          color: const Color(0xffc53be8),
                          text: 'Categories',
                          value: totalOfLastTwoWeekOfCategories.toString(),
                        ),
                      if (controller.productsController.selectedItem == "Week")
                        CardOfMyShop(
                          color: const Color(0xffc53be8),
                          text: 'Categories',
                          value: totalCategoriesOfLastWeek.toString(),
                        ),
                    ],
                  ),
                ),
                sizeVertical(height10),
                Padding(
                  padding: EdgeInsets.only(left: width10),
                  child: Row(
                    children: [
                      if (controller.productsController.selectedItem == "All")
                        CardOfMyShop(
                          color: const Color(0xfffcc84e),
                          text: 'Users',
                          value: controller.usersController.users.length
                              .toString(),
                        ),
                      if (controller.productsController.selectedItem == "Month")
                        CardOfMyShop(
                          color: const Color(0xfffcc84e),
                          text: 'Users',
                          value: totalLastMonthUsers.toString(),
                        ),
                      if (controller.productsController.selectedItem ==
                          "2 Week")
                        CardOfMyShop(
                          color: const Color(0xfffcc84e),
                          text: 'Users',
                          value: totalOfLastTwoWeekUsersOfUsers.toString(),
                        ),
                      if (controller.productsController.selectedItem == "Week")
                        CardOfMyShop(
                          color: const Color(0xfffcc84e),
                          text: 'Users',
                          value: totalLastWeekUsers.toString(),
                        ),
                      sizeHorizontal(width15),
                      if (controller.productsController.selectedItem == "All")
                        CardOfMyShop(
                          color: const Color(0xff5695e6),
                          text: 'Orders',
                          value: controller.orderController.orderModel.length
                              .toString(),
                        ),
                      if (controller.productsController.selectedItem == "Month")
                        CardOfMyShop(
                          color: const Color(0xff5695e6),
                          text: 'Orders',
                          value: totalLastMonthOrders.toString(),
                        ),
                      if (controller.productsController.selectedItem ==
                          "2 Week")
                        CardOfMyShop(
                          color: const Color(0xff5695e6),
                          text: 'Orders',
                          value: totalOfLastTwoWeekOrders.toString(),
                        ),
                      if (controller.productsController.selectedItem == "Week")
                        CardOfMyShop(
                          color: const Color(0xff5695e6),
                          text: 'Orders',
                          value: totalLastWeekOrders.toString(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

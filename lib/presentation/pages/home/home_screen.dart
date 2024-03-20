import 'package:admin/controller/home/home_controller.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/dimensions.dart';
import '../../widgets/home/admin_information.dart';
import '../../widgets/home/brands/list_brands_widgets.dart';
import '../../widgets/home/categories/categories_list_widget.dart';
import '../../widgets/home/charts/container_chart.dart';
import '../../widgets/home/coupon/list_coupon_widget.dart';
import '../../widgets/home/delivery/list_delivery_widget.dart';
import '../../widgets/home/notification/list_notification_widget.dart';
import '../../widgets/home/orders/content_status_orders.dart';
import '../../widgets/home/orders/list_orders_widget.dart';
import '../../widgets/home/products/products_list_widgets.dart';
import '../../widgets/home/statistic_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
            child: GetBuilder<HomeControllerImpl>(builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AdminInformation(
                substring_username: controller.getInitials(
                    string: controller.username!.toUpperCase(), limitTo: 1),
                username: controller.username!.toUpperCase(),
              ),
              Expanded(
                child: SizedBox(
                  height: screenHeight,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.only(top: height20),
                      child: Column(
                        children: [
                          StatisticWidget(),
                          sizeVertical(height20),
                          ContentOfStatusOrders(
                            countPending:
                                controller.orderController.countPendingOrders ==
                                        null
                                    ? 0
                                    : controller
                                        .orderController.countPendingOrders!,
                            countAcceptedOrder: controller
                                        .orderController.countAcceptedOrders ==
                                    null
                                ? 0
                                : controller
                                    .orderController.countAcceptedOrders!,
                            countArchiveOrder:
                                controller.orderController.countArchiveOrders ==
                                        null
                                    ? 0
                                    : controller
                                        .orderController.countArchiveOrders!,
                          ),
                          sizeVertical(height20),
                          const ContainerOfProductChart(),
                          sizeVertical(height20),
                          const CategoriesListView(),
                          sizeVertical(height20),
                          const ProductListView(),
                          sizeVertical(height20),
                          const BrandListView(),
                          sizeVertical(height20),
                          const CouponListView(),
                          sizeVertical(height20),
                          const DeliveryListView(),
                          sizeVertical(height20),
                          const NotificationListView(),
                          sizeVertical(height20),
                          const OrderListView(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        })));
  }
}

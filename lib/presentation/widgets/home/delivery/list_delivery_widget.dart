import 'package:admin/data/model/coupon_model.dart';
import 'package:admin/data/model/delivery_model.dart';
import 'package:admin/presentation/widgets/home/coupon/search_coupon_list.dart';
import 'package:admin/presentation/widgets/home/delivery/filter_result_widget.dart';
import 'package:admin/presentation/widgets/home/delivery/list_delivery_filtered.dart';
import 'package:admin/presentation/widgets/home/delivery/search_delivery_list.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../header_of_section.dart';
import '../../global/text_app.dart';
import '../brands/search_brands_list.dart';
import '../coupon/content_coupon.dart';
import '../products/header_products.dart';
import 'content_delivery.dart';
import '../header_filter_section.dart';

class DeliveryListView extends GetView<HomeControllerImpl> {
  const DeliveryListView({super.key});

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
            height: screenHeight * .24,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: Colors.grey.shade200, width: 2),
                borderRadius: BorderRadius.circular(radius10)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height20),
                  child: HeaderOfFilterSection(
                    searchController: controller.searchDeliveriesController,
                    selectedDelivery:
                        controller.deliveryController.selectedDelivery,
                    deliveryItems: controller.deliveryController.delivery
                        .map((delivery) => DropdownMenuItem<String>(
                              value: delivery,
                              child: TextApp(
                                text: delivery,
                                color: const Color(0xff898fac),
                                fontSize: font14,
                              ),
                            )),
                    onChanged: (delivery) {
                      controller.checkValueDelivery(delivery);
                    },
                    onSearch: controller.onSearchDelivery,
                    onChangedDrop: (delivery) {
                      controller.onChangedDelivery(delivery!);
                      print(delivery);
                    },
                    text: 'Delivery List',
                  ),
                ),
                if (controller.deliveryController.selectedDelivery == "All")
                  ListDeliveryFiltered(
                      itemCount: controller.delivery.length,
                      listDeliveries: controller.delivery),
                if (controller.deliveryController.selectedDelivery == "1Week")
                  ListDeliveryFiltered(
                      itemCount:
                          controller.deliveryController.lastWeekDelivery.length,
                      listDeliveries:
                          controller.deliveryController.lastWeekDelivery),
                if (controller.deliveryController.selectedDelivery == "2Week")
                  ListDeliveryFiltered(
                      itemCount: controller
                          .deliveryController.lastTwoWeekDelivery.length,
                      listDeliveries:
                          controller.deliveryController.lastTwoWeekDelivery),
                if (controller.deliveryController.selectedDelivery == "1Month")
                  ListDeliveryFiltered(
                      itemCount: controller
                          .deliveryController.lastMonthDelivery.length,
                      listDeliveries:
                      controller.deliveryController.lastMonthDelivery),

              ],
            ),
          ),
        ),
      );
    });
  }
}

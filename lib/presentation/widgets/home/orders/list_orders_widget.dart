import 'package:admin/presentation/widgets/home/orders/filter_order_list.dart';
import 'package:admin/presentation/widgets/home/orders/search_orders_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/delivery_order_model.dart';
import '../header_filter_section.dart';
import '../../global/text_app.dart';
import 'content_order.dart';

class OrderListView extends StatelessWidget {
  const OrderListView({super.key});

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
              padding: EdgeInsets.symmetric(vertical: height20),
              child: Column(
                children: [
                  HeaderOfFilterSection(
                    searchController: controller.searchOrdersController,
                    selectedDelivery: controller.orderController.selectedItem,
                    deliveryItems: controller.orderController.dropItems
                        .map((delivery) => DropdownMenuItem<String>(
                              value: delivery,
                              child: TextApp(
                                text: delivery,
                                color: const Color(0xff898fac),
                                fontSize: font14,
                              ),
                            )),
                    onChanged: (orders) {
                      controller.checkValueOrders(orders);
                    },
                    onSearch: controller.onSearchOrders,
                    onChangedDrop: (orders) {
                      controller.onChangedOrders(orders!);
                      print(orders);
                    },
                    text: 'Orders List',
                  ),

                  if (controller.orderController.selectedItem == "All")
                    SizedBox(
                      height: screenHeight * .16,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width10),
                        child: !controller.isSearchOrders
                            ? ListView.builder(
                                itemCount: controller.orders.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return ContentOrder(
                                      ordersModel: DeliveryOrderModel.fromJson(
                                          controller.orders[index]));
                                })
                            : SearchOfOrdersList(
                                ordersList: controller.ordersList,
                              ),
                      ),
                    ),

                  if (controller.orderController.selectedItem == "Week")
                    SizedBox(
                      height: screenHeight * .13,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width10),
                        child: !controller.isSearchOrders
                            ? ListView.builder(
                            itemCount: controller
                                .orderController.allLastWeekOrders.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return FilterOrderList(
                                  ordersModel: DeliveryOrderModel.fromJson(
                                      controller.orderController
                                          .allLastWeekOrders[index]));
                            })
                            : SearchOfOrdersList(
                          ordersList: controller.ordersList,
                        ),
                      ),
                    ),
                  if (controller.orderController.selectedItem == "2 Week")
                    SizedBox(
                      height: screenHeight * .13,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width10),
                        child: !controller.isSearchOrders
                            ? ListView.builder(
                            itemCount: controller
                                .orderController.allLastTwoWeekOrders.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return FilterOrderList(
                                  ordersModel: DeliveryOrderModel.fromJson(
                                      controller.orderController
                                          .allLastTwoWeekOrders[index]));
                            })
                            : SearchOfOrdersList(
                          ordersList: controller.ordersList,
                        ),
                      ),
                    ),
                  if (controller.orderController.selectedItem == "Month")
                    SizedBox(
                      height: screenHeight * .13,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width10),
                        child: !controller.isSearchOrders
                            ? ListView.builder(
                            itemCount: controller
                                .orderController.allLastMonthOrders.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return FilterOrderList(
                                  ordersModel: DeliveryOrderModel.fromJson(
                                      controller.orderController
                                          .allLastMonthOrders[index]));
                            })
                            : SearchOfOrdersList(
                          ordersList: controller.ordersList,
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

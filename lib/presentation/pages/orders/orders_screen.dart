import 'package:admin/controller/orders/view_orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../widgets/global/app_bar.dart';
import '../../widgets/global/header_section.dart';
import '../../widgets/orders/list_orders/content_orders_widget.dart';
import '../../widgets/orders/list_orders/not_found_order.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewOrdersController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:
          const AppBarWidget(title: "Orders", automaticallyImplyLeading: false),
      body: SafeArea(
          child: GetBuilder<ViewOrdersController>(builder: (controller) {
        return Column(
          children: [
            HeaderSection(
              text: 'Search for',
              productsLength: controller.orders.length,
              isShow: false,
            ),
            sizeVertical(height10),
            DefaultTabController(
                length: 3,
                child: Expanded(
                  child: Column(
                    children: [
                      TabBar(
                        labelStyle:
                            TextStyle(fontSize: font12, fontFamily: "Poppins"),
                        tabs: const [
                          Tab(
                            text: "Pending",
                            iconMargin: EdgeInsets.zero,
                          ),
                          Tab(
                            text: "Accepted",
                          ),
                          Tab(
                            text: "Archive",
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            controller.pendingOrders.isNotEmpty
                                ? ContentOfOrdersList(
                                    orderModel: controller.pendingOrders,
                                  )
                                : const NotFoundOrder(
                                    notFoundText: 'Pending',
                                  ),
                            controller.acceptedOrders.isNotEmpty
                                ? ContentOfOrdersList(
                                    orderModel: controller.acceptedOrders,
                                  )
                                : const NotFoundOrder(
                                    notFoundText: 'Accepted',
                                  ),
                            controller.archiveOrders.isNotEmpty
                                ? ContentOfOrdersList(
                                    orderModel: controller.archiveOrders,
                                  )
                                : const NotFoundOrder(
                                    notFoundText: 'Acrhives',
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        );
      })),
    );
  }
}

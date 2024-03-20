import 'package:admin/controller/orders/view_orders_controller.dart';
import 'package:admin/core/constants/api_constants.dart';
import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/delivery_order_model.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:admin/presentation/widgets/products/view_products/grid_component/manage_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../../../core/constants/routes.dart';
import '../../products/view_products/search_section_widget.dart';

class ContentOfOrdersList extends GetView<ViewOrdersController> {
  final List<DeliveryOrderModel> orderModel;
  const ContentOfOrdersList({super.key, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewOrdersController());
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height20, bottom: height5),
            child: SearchSection(
              onSearch: controller.onSearchOrders,
              onChanged: (value) {
                controller.checkValueOrders(value);
              },
              controller: controller.searchOrdersController,
              searchText: 'Search Orders...',
            ),
          ),
          Flexible(
            child: ScrollableTableView(
              headerBackgroundColor: AppColors.primaryColor,
              headers: [
                "Product Name",
                "Delivery",
                "Amount",
                "Date",
                "Total Product",
                "Manage",
              ].map((label) {
                return TableViewHeader(
                  label: label,
                  minWidth: 110,
                  alignment: Alignment.center,
                  textStyle: TextStyle(color: Colors.white, fontSize: font14),
                );
              }).toList(),
              rows: List.generate(orderModel.length, (index) {
                return TableViewRow(height: screenHeight * .08, cells: [
                  TableViewCell(
                    padding: EdgeInsets.symmetric(
                        horizontal: width5, vertical: height5),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Container(
                          height: height42,
                          width: width42,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${ApiConstants.IMAGE_ITEMS}/${orderModel[index].productImage}"),
                              )),
                        ),
                        sizeHorizontal(width5),
                        Expanded(
                          child: TextApp(
                            text: "${orderModel[index].productName}",
                            fontSize: font13,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TableViewCell(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: width5),
                        child: TextApp(
                          text: "${orderModel[index].deliveryUsername}",
                          fontSize: font14,
                          color: AppColors.textColor,
                        ),
                      )),
                  TableViewCell(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: width5),
                      child: TextApp(
                        text:
                            "\$${double.parse("${orderModel[index].countPrice}")}",
                        fontSize: font14,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  TableViewCell(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: width5),
                      child: TextApp(
                        text: DateFormat("yMMMd").format(
                            DateTime.parse("${orderModel[index].ordersDate}")),
                        fontSize: font14,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  TableViewCell(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(left: width5),
                      child: TextApp(
                        text: "${orderModel[index].countProducts}",
                        fontSize: font14,
                        color: AppColors.textColor,
                      ),
                    ),
                  ),
                  TableViewCell(
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        const ManagementButtonWidget(
                            icon: Icons.check,
                            color: AppColors.starColor,
                            iconColor: AppColors.white),
                        sizeHorizontal(width5),
                        const ManagementButtonWidget(
                            icon: Icons.delete_outline,
                            color: AppColors.trashColor,
                            iconColor: AppColors.white),
                        sizeHorizontal(width5),
                        ManagementButtonWidget(
                          icon: Icons.visibility_outlined,
                          color: AppColors.green,
                          iconColor: AppColors.white,
                          onTap: () {
                            Get.toNamed(AppRoutes.orderDetail, arguments: {
                              "orderModel": controller.orders[index]
                            });
                            print(
                                "this is order model ${controller.orders[index]}");
                          },
                        ),
                      ],
                    ),
                  ),
                ]);
              }),
            ),
          ),
        ],
      ),
    );
  }
}

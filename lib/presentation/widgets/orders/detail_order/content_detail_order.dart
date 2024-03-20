import 'package:admin/presentation/widgets/orders/detail_order/product_detail_order.dart';
import 'package:admin/presentation/widgets/orders/detail_order/rating_list_widget.dart';
import 'package:admin/presentation/widgets/orders/detail_order/single_order_detail.dart';
import 'package:admin/presentation/widgets/orders/detail_order/total_price_order.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/orders/detail_order/detail_order_controller.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';
import 'address_order_detail.dart';

class OrderDetailContent extends StatelessWidget {
  const OrderDetailContent(
      {super.key,
      this.isOpen = false,
      this.onOpenAddress,
      this.isOpenItem = false,
      this.onTapOpenItem,
      required this.addressName,
      required this.street,
      required this.dateOrder,
      required this.timeOrder,
      required this.idOrder,
      required this.statusOrder,
      required this.googleContainer,
      required this.typeOrder,
      required this.paymentType,
      this.isMap = true});
  final bool? isOpen;
  final bool? isOpenItem;
  final void Function()? onOpenAddress;
  final void Function()? onTapOpenItem;
  final String addressName;
  final String street;
  final String dateOrder;
  final String timeOrder;
  final String typeOrder;
  final String idOrder;
  final String statusOrder;
  final String paymentType;
  final Container googleContainer;
  final bool? isMap;
  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImpl());
    return GetBuilder<OrderDetailsControllerImpl>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            controller.orderModel!.ordersType != 1
                ? googleContainer
                : Container(
                    color: Colors.red,
                  ),
            controller.orderModel!.addressId != null
                ? sizeVertical(height42 * 1.2)
                : sizeVertical(height10),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: Colors.grey[300]!, width: 1.2),
                  borderRadius: BorderRadius.circular(radius10)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width15, vertical: height10),
                child: Column(
                  children: [
                    SingleOrderDetail(
                        title: "Order Created at", description: dateOrder),
                    Divider(
                      thickness: 1,
                      color: AppColors.subtitleColor,
                    ),
                    SingleOrderDetail(
                        title: "Order Time", description: timeOrder),
                    Divider(
                      thickness: 1,
                      color: AppColors.subtitleColor,
                    ),
                    SingleOrderDetail(title: "Order ID", description: idOrder),
                    Divider(
                      thickness: 1,
                      color: AppColors.subtitleColor,
                    ),
                    SingleOrderDetail(
                        title: "Order Status", description: statusOrder),
                  ],
                ),
              ),
            ),
            sizeVertical(height20),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: Colors.grey[300]!, width: 1.2),
                  borderRadius: BorderRadius.circular(radius10)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width15, vertical: height10),
                child: Column(
                  children: [
                    SingleOrderDetail(
                        title: "Payment Type", description: paymentType),
                    Divider(
                      thickness: 1,
                      color: AppColors.subtitleColor,
                    ),
                    SingleOrderDetail(
                        title: "Order Type", description: typeOrder),
                  ],
                ),
              ),
            ),
            sizeVertical(height20),
            controller.orderModel!.addressId == null
                ? const SizedBox(
                    height: 0,
                    width: 0,
                  )
                : AddressOrderDetail(
                    addressName: addressName,
                    street: street,
                    isOpen: isOpen,
                    onOpenAddress: onOpenAddress,
                  ),
            sizeVertical(height20),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: Colors.grey[300]!, width: 1.2),
                  borderRadius: BorderRadius.circular(radius10)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width15, vertical: height10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextApp(
                            text: "Items",
                            fontSize: font14,
                            color: AppColors.textColor!.withOpacity(0.7),
                          ),
                          GestureDetector(
                              onTap: onTapOpenItem,
                              child: Icon(
                                isOpenItem != false
                                    ? EneftyIcons.arrow_right_3_outline
                                    : EneftyIcons.arrow_down_outline,
                                color: AppColors.subtitleColor,
                                size: font22,
                              ))
                        ],
                      ),
                    ),
                    isOpenItem == false
                        ? ProductSectionOfOrderDetail(
                            productName:
                                "${controller.orderModel!.productName}",
                            productQuantity:
                                "${controller.orderModel!.countProducts}",
                            productPriceOfAllOrder:
                                "\$${double.parse("${controller.orderModel!.countPrice}")}",
                            isOpenItem: isOpenItem,
                            onTapOpenItem: onTapOpenItem,
                            imageUrl:
                                '${ApiConstants.IMAGE_ITEMS}/${controller.orderModel!.productImage}',
                            totalPrice:
                                '\$${double.parse("${controller.orderModel!.ordersTotalPrice}")}',
                            deliveryPrice:
                                '\$${controller.orderModel!.ordersPriceDelivery}',
                            productStock:
                                '${controller.orderModel!.productStock}',
                            productPrice:
                                '\$${controller.orderModel!.productPrice}',
                          )
                        : Container(),
                    Divider(
                      thickness: 1,
                      color: AppColors.subtitleColor,
                    ),
                    TotalPriceOfOrderDetail(
                      totalPrice: '\$${controller.orderModel!.ordersPrice}',
                      title: 'Total Price',
                    ),
                  ],
                ),
              ),
            ),
            sizeVertical(height20),
            const RatingList()
          ],
        ),
      );
    });
  }
}

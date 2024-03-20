import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../../../../controller/orders/detail_order/detail_order_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../widgets/global/app_bar.dart';
import '../../../widgets/orders/detail_order/content_detail_order.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImpl());
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Order Detail',
        automaticallyImplyLeading: true,
        onPressed: () => Get.back(),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width10),
            child: GetBuilder<OrderDetailsControllerImpl>(builder: (controller) {
              return OrderDetailContent(
                onOpenAddress: () {
                  controller.selectArrowButton();
                },
                isOpen: controller.isOpen,
                isOpenItem: controller.isOpenItem,
                onTapOpenItem: () {
                  controller.selectOpenItem();
                },
                addressName: '${controller.orderModel!.addressName}',
                street:
                '${controller.orderModel!.addressCity} ${controller.orderModel!.addressStreet}',
                dateOrder: DateFormat("dd-MM-yyyy")
                    .format(DateTime.parse("${controller.orderModel!.ordersDate}")),
                timeOrder: DateFormat("hh:mm")
                    .format(DateTime.parse("${controller.orderModel!.ordersDate}")),
                idOrder: '#${controller.orderModel!.ordersId}',
                statusOrder:
                '${controller.statusOfOrder("${controller.orderModel!.ordersStatus}")}',
                googleContainer:controller.orderModel!.ordersType == 0 ?Container(
                  height: screenHeight *.28,
                  width: double.infinity,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers: controller.markers.toSet(),
                    onMapCreated:
                        (GoogleMapController googleMapController) {
                      controller.controllerMap!
                          .complete(googleMapController);
                    },
                    initialCameraPosition: controller.kGooglePlex!,
                  ),
                ):Container(),
                typeOrder:
                '${controller.typeOfOrder('${controller.orderModel!.ordersType}')}',
                paymentType:
                '${controller.typeOfPayment('${controller.orderModel!.ordersPaymentmethod}')}',
              );
            }),
          )),
    );
  }
}

import 'package:admin/controller/home/home_controller.dart';
import 'package:admin/presentation/widgets/home/delivery/search_delivery_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/delivery_model.dart';
import 'content_delivery.dart';

class ListDeliveryFiltered extends GetView<HomeControllerImpl> {
  const ListDeliveryFiltered({super.key,required this.itemCount, required this.listDeliveries});
  final int itemCount;
  final List<dynamic> listDeliveries;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return SizedBox(
      height: screenHeight * .13,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width10),
        child: !controller.isSearchDelivery
            ? ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ContentOfDelivery(
                  deliveryModel: DeliveryModel.fromJson(
                      listDeliveries[index]));
            })
            : SearchOfDeliveryList(
          deliveryList: controller.deliveryList,
        ),
      ),
    );
  }
}

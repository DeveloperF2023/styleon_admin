import 'package:admin/controller/users/historic_users/historic_users_controller.dart';
import 'package:admin/presentation/widgets/users/historic_users/body/orders_section/single_content_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/model/order_detail_model.dart';

class ListOfOrdersWidget extends GetView<HistoricUsersController> {
  const ListOfOrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoricUsersController());
    return Row(
      children: List.generate(
          controller.orders.length,
          (index) => SingleContentOfOrderWidget(
                orders: OrderDetailModel.fromJson(controller.orders[index]),
              )),
    );
  }
}

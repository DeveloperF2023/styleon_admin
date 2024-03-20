import 'package:admin/controller/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/dimensions.dart';
import 'bar_charts.dart';

class ContainerOfProductChart extends GetView<HomeControllerImpl> {
  const ContainerOfProductChart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius10),
        ),
        child: Container(
          height: screenHeight * .35,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade200, width: 2),
            borderRadius: BorderRadius.circular(radius10),
          ),
          child: ApiChart(productModel: controller.productsController.products),
        ),
      ),
    );
  }
}

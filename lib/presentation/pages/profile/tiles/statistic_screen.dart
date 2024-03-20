import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/profile/tiles/statistic/statistic_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../widgets/global/app_bar.dart';

class StatisticScreen extends StatelessWidget {
  const StatisticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(StatisticController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: "Statistic",
        automaticallyImplyLeading: true,
        onPressed: () => Get.back(),
      ),
      body: SafeArea(
          child: GetBuilder<StatisticController>(builder: (controller) {
        return Column(
          children: [],
        );
      })),
    );
  }
}

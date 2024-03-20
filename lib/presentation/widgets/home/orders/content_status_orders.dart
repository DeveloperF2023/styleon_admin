import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/orders_model.dart';
import '../../global/container_colored_status.dart';
import 'single_statistic_order.dart';

class ContentOfStatusOrders extends StatelessWidget {
  final int countPending;
  final int countAcceptedOrder;
  final int countArchiveOrder;
  const ContentOfStatusOrders({
    super.key,
    required this.countPending,
    required this.countAcceptedOrder,
    required this.countArchiveOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: Card(
          surfaceTintColor: AppColors.white,
          color: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius10),
          ),
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius10),
                color: AppColors.white,
                border: Border.all(color: Colors.grey.shade200, width: 2)),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width15, vertical: height10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:height10),
                    child: TextApp(
                      text: "Orders Statistic",
                      fontSize: font18,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  sizeVertical(height10),
                  SingleStatisticOrder(
                    color: const Color(0xfffcc84e),
                    text: "Pending",
                    countPending: countPending,
                  ),
                  Divider(
                    color: AppColors.subtitleColor,
                    thickness: 0.5,
                  ),
                  SingleStatisticOrder(
                    color: const Color(0xff5695e6),
                    text: "Delivered",
                    countPending: countAcceptedOrder,
                  ),
                  Divider(
                    color: AppColors.subtitleColor,
                    thickness: 0.5,
                  ),
                  SingleStatisticOrder(
                    color: AppColors.green,
                    text: "Archive",
                    countPending: countArchiveOrder,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

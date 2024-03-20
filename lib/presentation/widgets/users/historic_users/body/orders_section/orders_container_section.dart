import 'package:flutter/material.dart';

import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/dimensions.dart';
import '../../../../global/text_app.dart';
import 'list_orders_widget.dart';

class OrdersContentWidget extends StatelessWidget {
  const OrdersContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width10),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius5),
                color: Colors.white),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width10, vertical: height20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextApp(
                        text: "Orders",
                        fontSize: font18,
                        color: AppColors.textColor,
                      ),
                    ],
                  ),
                  sizeVertical(height10),
                  ListOfOrdersWidget()
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

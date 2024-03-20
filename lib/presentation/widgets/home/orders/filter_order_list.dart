import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/delivery_order_model.dart';
import '../../global/text_app.dart';

class FilterOrderList extends StatelessWidget {
  final DeliveryOrderModel ordersModel;
  const FilterOrderList({super.key, required this.ordersModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: width10),
      child: Container(
        height: screenHeight * .08,
        width: screenWidth * .82,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: screenHeight * .07,
                  width: screenWidth * .15,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius5),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${ApiConstants.IMAGE_ITEMS}/${ordersModel.productImage}"))),
                ),
                sizeHorizontal(width10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextApp(
                      text: "${ordersModel.productName}",
                      fontSize: font16,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                    ),
                    TextApp(
                      text: "\$${ordersModel.ordersPrice.toString()}",
                      fontSize: font14,
                      color: AppColors.subtitleColor,
                      fontWeight: FontWeight.bold,
                    ),
                    TextApp(
                      text: "Items ${ordersModel.countProducts.toString()}",
                      fontSize: font14,
                      color: AppColors.subtitleColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
            TextApp(
              text: DateFormat("MMMEd")
                  .format(DateTime.parse("${ordersModel.ordersDate}")),
              fontSize: font14,
              color: AppColors.subtitleColor,
              fontWeight: FontWeight.w400,
            ),
            if (ordersModel.ordersStatus == 2)
              Container(
                decoration: BoxDecoration(
                    color: AppColors.starColor,
                    borderRadius: BorderRadius.circular(radius5)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width5, vertical: height5),
                  child: TextApp(
                    text: "Pending",
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                ),
              ),
            if (ordersModel.ordersStatus == 3)
              Container(
                decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(radius5)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width5, vertical: height5),
                  child: TextApp(
                    text: "Accepted",
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            if (ordersModel.ordersStatus == 4)
              Container(
                decoration: BoxDecoration(
                    color: AppColors.green,
                    borderRadius: BorderRadius.circular(radius5)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width5, vertical: height5),
                  child: TextApp(
                    text: "Archive",
                    fontSize: 10,
                    color: AppColors.white,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}

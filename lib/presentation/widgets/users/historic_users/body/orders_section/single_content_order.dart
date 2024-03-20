import 'package:admin/core/constants/api_constants.dart';
import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/order_detail_model.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SingleContentOfOrderWidget extends StatelessWidget {
  final OrderDetailModel orders;
  const SingleContentOfOrderWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: screenHeight * .15,
                width: screenWidth * .3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        image: NetworkImage(
                            "${ApiConstants.IMAGE_ITEMS}/${orders.productImage}"))),
              ),
              Positioned(
                top: height5,
                right: width5,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius5),
                      color: Colors.black38),
                  child: Center(
                      child: orders.ordersPaymentMethod == 0
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width3, vertical: height3),
                              child: TextApp(
                                text: "Cash",
                                fontSize: 10,
                                color: AppColors.white,
                              ),
                            )
                          : Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width3, vertical: height3),
                              child: TextApp(
                                text: "Credit Card",
                                fontSize: 10,
                                color: AppColors.white,
                              ),
                            )),
                ),
              )
            ],
          ),
          sizeVertical(height5),
          TextApp(
            text: orders.productName!,
            color: AppColors.textColor,
            fontSize: font14,
          ),
          Row(
            children: [
              Icon(
                Icons.date_range,
                color: const Color(0xff4940ff),
                size: font14,
              ),
              sizeHorizontal(width5),
              TextApp(
                text: DateFormat("MMMd")
                    .format(DateTime.parse(orders.ordersDate!)),
                color: AppColors.subtitleColor,
                fontSize: font12,
              ),
              sizeHorizontal(width5),
              SizedBox(
                  height: 11,
                  child: VerticalDivider(
                    thickness: 1.2,
                    color: AppColors.subtitleColor,
                    width: 0.5,
                  )),
              sizeHorizontal(width5),
              TextApp(
                text: "${orders.countProducts.toString()} Items",
                color: AppColors.subtitleColor,
                fontSize: font12,
              ),
            ],
          ),
          TextApp(
            text: "\$${double.parse(orders.countPrice.toString())}",
            color: AppColors.textColor,
            fontSize: font12,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

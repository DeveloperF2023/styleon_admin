import 'package:admin/data/model/delivery_model.dart';
import 'package:admin/presentation/widgets/home/delivery/status_delivery_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../data/model/products_model.dart';
import '../../global/text_app.dart';
import 'call_widget.dart';
import 'delivery_information_widget.dart';

class FilterResultWidget extends StatelessWidget {
  final DeliveryModel deliveryModel;
  const FilterResultWidget({super.key, required this.deliveryModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width10),
      child: Card(
        surfaceTintColor: AppColors.white,
        color: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius5),
        ),
        child: Container(
          width: screenWidth * .7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius5),
            color: AppColors.white,
          ),
          child: Row(
            children: [
              Container(
                width: screenWidth * .23,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(radius5),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(ImageAssets.deliveryMan))),
              ),
              sizeHorizontal(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: deliveryModel.deliveryApprove == 1
                            ? AppColors.primaryColor
                            : AppColors.starColor,
                        borderRadius: BorderRadius.circular(radius5)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width5, vertical: height3),
                      child: deliveryModel.deliveryApprove == 1
                          ?const StatusOfDelivery(status: "Approved")
                          : const StatusOfDelivery(status: "Rejected"),
                    ),
                  ),
                  TextApp(
                    text: "${deliveryModel.deliveryUsername}",
                    fontSize: font16,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  InformationOfDeliveryWidget(deliveryInfo: "${deliveryModel.deliveryEmail}", icon: Icons.mail),
                  InformationOfDeliveryWidget(deliveryInfo: "${deliveryModel.deliveryPhone}", icon: Icons.phone_android),
                  CallWidget(deliveryPhone: "${deliveryModel.deliveryPhone}"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

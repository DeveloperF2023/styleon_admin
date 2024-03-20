import 'package:admin/controller/users/historic_users/historic_users_controller.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/address_model.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/app_constants.dart';

class SingleContentOfAddress extends GetView<HistoricUsersController> {
  final AddressModel addressModel;
  const SingleContentOfAddress({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoricUsersController());
    return Padding(
      padding: EdgeInsets.only(right: width10),
      child: Row(
        children: [
          Container(
            height: height42 * 1.5,
            width: width42,
            decoration: BoxDecoration(
                color: const Color(0xff4940ff).withOpacity(0.7),
                borderRadius: BorderRadius.circular(radius5)),
            child: Center(
              child: Icon(
                Icons.location_on,
                color: AppColors.white,
                size: font20,
              ),
            ),
          ),
          sizeHorizontal(width5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextApp(
                text: addressModel.addressName!,
                color: AppColors.textColor,
                fontSize: font14,
                fontWeight: FontWeight.bold,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_city,
                    color: const Color(0xff4940ff),
                    size: font16,
                  ),
                  sizeHorizontal(width3),
                  SizedBox(
                    width: screenWidth * .35,
                    child: TextApp(
                      text: addressModel.addressCity!,
                      color: AppColors.grey600,
                      fontSize: font12,
                    ),
                  ),
                  sizeHorizontal(width5),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppColors.green,
                    size: font16,
                  ),
                  sizeHorizontal(width3),
                  SizedBox(
                    width: screenWidth * .35,
                    child: TextApp(
                      text: addressModel.addressStreet!,
                      color: AppColors.grey600,
                      fontSize: font12,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

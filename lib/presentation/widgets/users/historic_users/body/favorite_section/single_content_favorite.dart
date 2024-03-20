import 'package:admin/controller/users/historic_users/historic_users_controller.dart';
import 'package:admin/core/constants/api_constants.dart';
import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/data/model/favorite_model.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SingleContentOfFavoriteWidget extends GetView<HistoricUsersController> {
  final FavoriteModel favorites;
  const SingleContentOfFavoriteWidget({super.key, required this.favorites});

  @override
  Widget build(BuildContext context) {
    Get.put(HistoricUsersController());
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
                            "${ApiConstants.IMAGE_ITEMS}/${favorites.productImage}"))),
              ),
              Positioned(
                top: height5,
                right: width5,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width5, vertical: height5),
                    child: Icon(
                      EneftyIcons.heart_bold,
                      color: AppColors.textColor,
                      size: font16,
                    ),
                  )),
                ),
              )
            ],
          ),
          sizeVertical(height5),
          TextApp(
            text: favorites.productName!,
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
                    .format(DateTime.parse(favorites.createdAtProduct!)),
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
              favorites.productStatus == 0
                  ? Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.trashColor,
                          size: 10,
                        ),
                        sizeHorizontal(width3),
                        TextApp(
                          text: controller
                              .statusOfProduct(favorites.productStatus),
                          color: AppColors.textColor,
                          fontSize: 10,
                        )
                      ],
                    )
                  : Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.green,
                          size: 10,
                        ),
                        sizeHorizontal(width3),
                        TextApp(
                          text: controller
                              .statusOfProduct(favorites.productStatus),
                          color: AppColors.textColor,
                          fontSize: 10,
                        )
                      ],
                    )
            ],
          ),
          TextApp(
            text: "\$${double.parse(favorites.productPrice.toString())}",
            color: AppColors.textColor,
            fontSize: font12,
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}

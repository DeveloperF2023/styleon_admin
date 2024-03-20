import 'package:admin/controller/orders/detail_order/detail_order_controller.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/routes.dart';
import '../../global/text_app.dart';
import '../../users/historic_users/body/user_information_section/username_substring_widget.dart';

class RatingList extends GetView<OrderDetailsControllerImpl> {
  const RatingList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsControllerImpl());
    return Padding(
      padding: EdgeInsets.only(bottom: height10),
      child: SizedBox(
        width: double.infinity,
        height: screenHeight * .24,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              controller.rating.length,
              (index) => Container(
                    width: screenWidth * .95,
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.grey[300]!, width: 1.2),
                        borderRadius: BorderRadius.circular(radius10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width10, vertical: height10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.historicUsers,
                                            arguments: {
                                              "userId": controller
                                                  .rating[index].userId,
                                              "username": controller
                                                  .rating[index].username,
                                              "addressLat": controller
                                                  .rating[index].addressLat,
                                              "addressLong": controller
                                                  .rating[index].addressLong,
                                            });
                                      },
                                      child: UsernameSubstringWidget(
                                          username: controller.getInitials(
                                              string: controller
                                                  .rating[index].username!
                                                  .toUpperCase(),
                                              limitTo: 1))),
                                  sizeHorizontal(width10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextApp(
                                        text:
                                            controller.rating[index].username!,
                                        fontSize: font16,
                                        color: AppColors.textColor,
                                      ),
                                      TextApp(
                                        text: controller.rating[index].email!,
                                        fontSize: font14,
                                        color: AppColors.textColor!
                                            .withOpacity(0.5),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              sizeHorizontal(width42),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(radius5),
                                    color: Colors.black38),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width10, vertical: height3),
                                  child: Row(
                                    children: [
                                      Icon(
                                        EneftyIcons.star_bold,
                                        color: AppColors.starColor,
                                        size: font14,
                                      ),
                                      TextApp(
                                        text: controller
                                            .rating[index].ratingNumber
                                            .toString(),
                                        fontSize: font14,
                                        color: AppColors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          sizeVertical(height20),
                          SizedBox(
                            width: screenWidth * .9,
                            child: TextApp(
                              text: controller.rating[index].ratingDescription!,
                              fontSize: font14,
                              color: AppColors.textColor,
                            ),
                          ),
                          sizeVertical(height10),
                          Container(
                            height: screenHeight * .07,
                            width: screenWidth * .15,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius5),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        "${ApiConstants.IMAGE_ITEMS}/${controller.rating[index].productImage}"))),
                          ),
                        ],
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}

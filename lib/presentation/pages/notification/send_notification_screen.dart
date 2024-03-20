import 'package:admin/controller/notification/add_notification_controller.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../widgets/global/app_bar.dart';
import '../../widgets/global/navigation_button_widget.dart';
import '../../widgets/global/text_app.dart';
import '../../widgets/products/edit_product/field_section_widget.dart';

class SendNotificationScreen extends StatelessWidget {
  const SendNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddNotificationController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: "Send Notification",
        automaticallyImplyLeading: true,
        onPressed: () {
          Get.back();
        },
      ),
      body: SafeArea(
          child: GetBuilder<AddNotificationController>(builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextApp(
                      text: "* All fields are required",
                      fontSize: font14,
                      color: AppColors.green,
                    ),
                    Container(
                      height: height42,
                      child: TextButton.icon(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.fillColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(radius5))),
                          onPressed: () {
                            Get.toNamed(AppRoutes.sendNotificationForAllUser);
                          },
                          icon: Icon(
                            Icons.supervised_user_circle_rounded,
                            color: AppColors.primaryColor,
                          ),
                          label: TextApp(
                            text: "Send to User",
                            fontSize: font14,
                          )),
                    )
                  ],
                ),
                sizeVertical(height10),
                Form(
                    key: controller.addFormState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FieldSectionWidget(
                              controller:
                                  controller.titleNotificationController!,
                              title: '* Title',
                            ),
                          ],
                        ),
                        sizeVertical(height20),
                        Row(
                          children: [
                            FieldSectionWidget(
                              controller:
                                  controller.bodyNotificationController!,
                              title: '* Description',
                            ),
                          ],
                        ),
                        sizeVertical(height20),
                        NavigationButtonWidget(
                          textButton: "Send Notification",
                          icon: Icons.send,
                          onPressed: () {
                            controller.addNotification();
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
        );
      })),
    );
  }
}

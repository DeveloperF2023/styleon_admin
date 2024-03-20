import 'package:admin/controller/notification/send_specific_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../widgets/global/app_bar.dart';
import '../../widgets/global/navigation_button_widget.dart';
import '../../widgets/global/text_app.dart';
import '../../widgets/notification/drop_down_users.dart';
import '../../widgets/products/edit_product/field_section_widget.dart';

class SendNotificationOfAllUsersScreen extends StatelessWidget {
  const SendNotificationOfAllUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SendToSpecificUserNotificationController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        title: "Send Notification",
        automaticallyImplyLeading: true,
        onPressed: () {
          Get.back();
        },
      ),
      body: SafeArea(child:
          GetBuilder<SendToSpecificUserNotificationController>(
              builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextApp(
                  text: "* All fields are required",
                  fontSize: font14,
                  color: AppColors.green,
                ),
                sizeVertical(height10),
                Form(
                    key: controller.sendFormState,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            FieldSectionWidget(
                              controller:
                                  controller.titleNotificationUserController!,
                              title: '* Title',
                            ),
                          ],
                        ),
                        sizeVertical(height20),
                        Row(
                          children: [
                            FieldSectionWidget(
                              controller:
                                  controller.bodyNotificationUserController!,
                              title: '* Description',
                            ),
                          ],
                        ),
                        sizeVertical(height20),
                        TextApp(
                          text: "* Users",
                          fontSize: font12,
                          color: AppColors.textColor,
                        ),
                        sizeVertical(height5),
                        SearchOfDropDownUsersList(
                          title: 'Users',
                          users: controller.dropDownUsers,
                          dropDownSelectedName: controller.usernameController!,
                          dropDownSelectedId: controller.userIDController!,
                        ),
                        sizeVertical(height20),
                        NavigationButtonWidget(
                          textButton: "Send Notification",
                          icon: Icons.send,
                          onPressed: () {
                            controller.sendToSpecificUser();
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

import 'package:admin/controller/notification/view_notification_controller.dart';
import 'package:admin/data/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';

class RemoveNotificationDialog extends StatelessWidget {
  final NotificationModel notificationModel;
  const RemoveNotificationDialog({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewNotificationController());
    return GetBuilder<ViewNotificationController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async => false,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius10)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: TextApp(
                    text: "Delete ${notificationModel.notificationTitle}",
                    fontSize: font16,
                    color: AppColors.textColor,
                  ),
                ),
                sizeVertical(height10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width10),
                  child: Text(
                    "Do you want to remove ${notificationModel.notificationTitle}",
                  ),
                ),
                sizeVertical(height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: TextButton.styleFrom(
                            side: BorderSide(color: AppColors.textColor!),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(radius5))),
                        child: TextApp(
                          text: "Cancel",
                          fontSize: font14,
                          color: AppColors.textColor,
                        )),
                    sizeHorizontal(width10),
                    TextButton(
                        onPressed: () {
                          controller.deleteNotification(
                              notificationModel.notificationId.toString());
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(radius5),
                            )),
                        child: TextApp(
                          text: "Remove",
                          fontSize: font14,
                          color: AppColors.white,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

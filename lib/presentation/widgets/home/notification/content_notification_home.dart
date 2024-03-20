import 'package:admin/controller/notification/view_notification_controller.dart';
import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/widgets/home/notification/information_notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/notification_model.dart';

class ContentOfHomeNotification extends GetView<ViewNotificationController> {
  final NotificationModel notificationModel;
  const ContentOfHomeNotification({super.key, required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewNotificationController());
    return Padding(
      padding: EdgeInsets.only(right: width10, bottom: height10),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(radius10)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width10),
          child: Row(
            children: [
              sizeHorizontal(width10),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InformationOfNotificationWidget(
                      notificationInfo: notificationModel.notificationTitle!,
                      icon: Icons.text_snippet_outlined,
                    ),
                    InformationOfNotificationWidget(
                      notificationInfo: notificationModel.notificationBody!,
                      icon: Icons.info_outline,
                    ),
                    InformationOfNotificationWidget(
                      notificationInfo:
                          "On ${DateFormat("yMMMd").format(DateTime.parse("${notificationModel.notificationDate}"))}",
                      icon: Icons.date_range,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

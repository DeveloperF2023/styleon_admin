import 'package:admin/data/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../controller/notification/view_notification_controller.dart';
import 'content_notification.dart';

class ListViewOfNotificationFiltered
    extends GetView<ViewNotificationController> {
  const ListViewOfNotificationFiltered(
      {super.key, required this.itemCount, required this.notifications});
  final int itemCount;
  final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    Get.put(ViewNotificationController());
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width10,
        ),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: itemCount,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return ContentOfNotification(
                notificationModel: notifications[index],
              );
              //
            }),
      ),
    );
  }
}

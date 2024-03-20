import 'package:admin/data/model/notification_model.dart';
import 'package:admin/presentation/widgets/home/notification/search_notification_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../header_of_section.dart';
import 'content_notification_home.dart';

class NotificationListView extends GetView<HomeControllerImpl> {
  const NotificationListView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GetBuilder<HomeControllerImpl>(builder: (controller) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: width5),
        child: Card(
          surfaceTintColor: AppColors.textColor,
          color: AppColors.textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius10)),
          child: Container(
            height: screenHeight * .24,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: Colors.grey.shade200, width: 2),
                borderRadius: BorderRadius.circular(radius10)),
            child: Column(
              children: [
                HeaderOfSection(
                  searchController: controller.searchNotificationController,
                  onChanged: (value) {
                    controller.checkValueNotification(value);
                  },
                  onSearch: controller.onSearchNotification,
                  textSection: 'Notification List',
                ),
                SizedBox(
                  height: screenHeight * .13,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width10),
                    child: !controller.isSearchNotification
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.notification.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ContentOfHomeNotification(
                                  notificationModel: NotificationModel.fromJson(
                                      controller.notification[index]));
                            })
                        : SearchOfNotificationList(
                            notificationList: controller.notificationList,
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

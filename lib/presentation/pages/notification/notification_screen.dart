import 'package:admin/presentation/widgets/notification/search_notification_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/notification/view_notification_controller.dart';
import '../../../core/class/handling_dataview.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/routes.dart';
import '../../widgets/global/app_bar.dart';
import '../../widgets/global/filter_icon_widget.dart';
import '../../widgets/global/header_section.dart';
import '../../widgets/notification/list_notification_widget.dart';
import '../../widgets/orders/list_orders/not_found_order.dart';
import '../../widgets/products/view_products/search_section_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewNotificationController());
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBarWidget(
          title: "Notifications",
          automaticallyImplyLeading: true,
          onPressed: () => Get.back(),
        ),
        body: GetBuilder<ViewNotificationController>(builder: (controller) {
          return SafeArea(
              child: Column(
            children: [
              HeaderSection(
                productsLength: controller.notifications.length,
                text: 'Notification',
                textButton: "Send Notification",
                onPressed: () {
                  Get.toNamed(AppRoutes.addNotification);
                },
              ),
              SizedBox(
                height: height42,
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * .85,
                      child: SearchSection(
                        onSearch: controller.onSearchNotifications,
                        onChanged: (value) {
                          controller.checkValueNotifications(value);
                        },
                        controller: controller.searchNotificationController,
                        searchText: "Search Notifications",
                      ),
                    ),
                    sizeHorizontal(width5),
                    FilterIconWidget(onPressed: () {
                      controller.onChangeFilter();
                    }),
                  ],
                ),
              ),
              controller.isSelected == false
                  ? Container()
                  : SizedBox(
                      height: screenHeight * .05,
                      width: double.infinity,
                      child: ListView.builder(
                        itemCount: controller.dropItems.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(left: width10),
                            child: ChoiceChip(
                              label: Text(
                                controller.dropItems[index],
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: font12,
                                    color: controller.choiceIndex == index
                                        ? Colors.white
                                        : const Color(0xff898fac)),
                              ),
                              selected: controller.choiceIndex == index,
                              selectedColor: AppColors.green,
                              checkmarkColor: AppColors.white,
                              onSelected: (value) {
                                controller.onSelectedChoiceFilter(value, index);
                              },
                              backgroundColor: AppColors.white,
                            ),
                          );
                        },
                      ),
                    ),
              sizeVertical(height10),
              HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Flexible(
                    child: !controller.isSearchNotification
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  if (controller.choiceIndex == 0)
                                    controller.notifications.isNotEmpty
                                        ? ListViewOfNotificationFiltered(
                                            itemCount:
                                                controller.notifications.length,
                                            notifications:
                                                controller.notifications)
                                        : const NotFoundOrder(
                                            notFoundText: "The Notifications"),
                                  if (controller.choiceIndex == 1)
                                    controller.lastMonthNotification.isNotEmpty
                                        ? ListViewOfNotificationFiltered(
                                            itemCount: controller
                                                .lastMonthNotification.length,
                                            notifications: controller
                                                .lastMonthNotification)
                                        : const NotFoundOrder(
                                            notFoundText:
                                                "Notification of this month"),
                                  if (controller.choiceIndex == 2)
                                    controller.lastWeekNotification.isNotEmpty
                                        ? ListViewOfNotificationFiltered(
                                            itemCount: controller
                                                .lastWeekNotification.length,
                                            notifications:
                                                controller.lastWeekNotification)
                                        : const NotFoundOrder(
                                            notFoundText:
                                                "Notification of this week"),
                                ],
                              );
                            })
                        : SearchListOfNotification(
                            notifications: controller.searchNotificationList),
                  ))
            ],
          ));
        }));
  }
}

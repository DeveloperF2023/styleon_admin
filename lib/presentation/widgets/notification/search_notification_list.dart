import 'package:admin/core/constants/app_constants.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/dimensions.dart';
import 'package:admin/presentation/widgets/home/notification/information_notification_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/model/notification_model.dart';

class SearchListOfNotification extends StatelessWidget {
  final List<NotificationModel> notifications;
  const SearchListOfNotification({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notifications.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: width10, bottom: height10),
            child: Container(
              height: screenHeight * .11,
              width: screenWidth * .7,
              decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(radius10)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width10),
                child: Row(
                  children: [
                    sizeHorizontal(width10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InformationOfNotificationWidget(
                          notificationInfo:
                              notifications[index].notificationTitle!,
                          icon: Icons.text_snippet_outlined,
                        ),
                        InformationOfNotificationWidget(
                          notificationInfo:
                              notifications[index].notificationBody!,
                          icon: Icons.info_outline,
                        ),
                        InformationOfNotificationWidget(
                          notificationInfo:
                              "On ${DateFormat("yMMMd").format(DateTime.parse("${notifications[index].notificationDate}"))}",
                          icon: Icons.date_range,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}

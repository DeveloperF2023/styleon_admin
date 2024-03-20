import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/notification_model.dart';
import 'information_notification_widget.dart';

class SearchOfNotificationList extends StatelessWidget {
  final List<NotificationModel> notificationList;
  const SearchOfNotificationList({super.key, required this.notificationList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .13,
      width: double.infinity,
      child: ListView.builder(
          itemCount: notificationList.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
        return Card(
          surfaceTintColor: AppColors.white,
          color: AppColors.white,
          elevation: 1,
          child: Container(
            height: screenHeight * .13,
            width: screenWidth * .7,
            decoration: BoxDecoration(
                color: AppColors.white,
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
                        notificationInfo: notificationList[index].notificationTitle!,
                        icon: Icons.text_snippet_outlined,
                      ),
                      InformationOfNotificationWidget(
                        notificationInfo: notificationList[index].notificationBody!,
                        icon: Icons.info_outline,
                      ),
                      InformationOfNotificationWidget(
                        notificationInfo:
                        "On ${DateFormat("yMMMd").format(DateTime.parse("${notificationList[index].notificationDate}"))}",
                        icon: Icons.date_range,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

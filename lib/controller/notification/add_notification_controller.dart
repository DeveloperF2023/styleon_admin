import 'package:admin/controller/notification/view_notification_controller.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/data_source/remote/notification/add_notification_remote_datasource.dart';
import 'package:admin/data/model/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handling_data.dart';
import '../../presentation/widgets/global/text_app.dart';

class AddNotificationController extends GetxController {
  AddNotificationRemoteDataSource addNotificationRemoteDataSource =
      AddNotificationRemoteDataSource(Get.find());

  TextEditingController? titleNotificationController;
  TextEditingController? bodyNotificationController;

  List<NotificationModel> notifications = [];
  GlobalKey<FormState> addFormState = GlobalKey<FormState>();
  GlobalKey<FormState> sendFormState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;

  addNotification() async {
    if (addFormState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "notificationTitle": titleNotificationController!.text,
        "notificationBody": bodyNotificationController!.text,
        "dateNow": DateFormat("yyyy-MM-dd H:s").format(DateTime.now())
      };
      var response =
          await addNotificationRemoteDataSource.addNotification(data);
      statusRequest = handlingData(response);
      print("-------------View Products-----\n $response");
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.rawSnackbar(
            backgroundColor: AppColors.grey50!,
            duration: const Duration(seconds: 7),
            messageText: TextApp(
              text: "The Notification sent successfully",
              color: AppColors.textColor,
            ),
            titleText: TextApp(
              text: "Send Notification",
              color: AppColors.textColor,
            ),
          );
          ViewNotificationController notificationController = Get.find();
          notificationController.viewNotifications();
          Get.offNamed(AppRoutes.notification);
        } else {
          statusRequest = StatusRequest.failure;
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    titleNotificationController = TextEditingController();
    bodyNotificationController = TextEditingController();

    super.onInit();
  }
}

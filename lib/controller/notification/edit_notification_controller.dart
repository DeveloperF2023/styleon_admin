import 'package:admin/controller/notification/view_notification_controller.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/model/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/routes.dart';
import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/notification/edit_notification_remote_datasource.dart';
import '../../presentation/widgets/global/text_app.dart';

class EditNotificationController extends GetxController {
  EditNotificationRemoteDataSource editNotificationRemoteDataSource =
      EditNotificationRemoteDataSource(Get.find());
  TextEditingController? titleNotificationController;
  TextEditingController? bodyNotificationController;
  List<NotificationModel> notifications = [];
  GlobalKey<FormState> editFormState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  NotificationModel? notificationModel;

  editNotification() async {
    if (editFormState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "notificationTitle": titleNotificationController!.text,
        "notificationBody": bodyNotificationController!.text,
        "notificationId": notificationModel!.notificationId.toString()
      };
      var response =
          await editNotificationRemoteDataSource.editNotification(data);
      statusRequest = handlingData(response);
      print("-------------View Products-----\n $response");
      print(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.rawSnackbar(
            backgroundColor: AppColors.grey50!,
            duration: const Duration(seconds: 7),
            messageText: TextApp(
              text: "The Notification added successfully",
              color: AppColors.textColor,
            ),
            titleText: TextApp(
              text: "Add Category",
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
    notificationModel = Get.arguments['notificationModel'];
    titleNotificationController =
        TextEditingController(text: notificationModel!.notificationTitle);
    bodyNotificationController =
        TextEditingController(text: notificationModel!.notificationBody);
    super.onInit();
  }
}

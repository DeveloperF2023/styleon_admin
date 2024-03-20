import 'package:admin/controller/notification/view_notification_controller.dart';
import 'package:admin/data/data_source/remote/users/view_users_remote_datasource.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/routes.dart';
import '../../core/enum/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/notification/send_specific_user_notification_remote_datasource.dart';
import '../../data/model/users_model.dart';
import '../../presentation/widgets/global/text_app.dart';

class SendToSpecificUserNotificationController extends GetxController {
  SendNotificationToSpecificUserRemoteDataSource
      sendNotificationToSpecificUserRemoteDataSource =
      SendNotificationToSpecificUserRemoteDataSource(Get.find());
  ViewUsersRemoteDataSource viewUsersRemoteDataSource =
      ViewUsersRemoteDataSource(Get.find());
  List<SelectedListItem> dropDownUsers = [];
  List<UsersModel> users = [];
  GlobalKey<FormState> sendFormState = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? titleNotificationUserController;
  TextEditingController? bodyNotificationUserController;
  TextEditingController? userIDController;
  TextEditingController? usernameController;

  sendToSpecificUser() async {
    if (sendFormState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "notificationTitle": titleNotificationUserController!.text,
        "notificationBody": bodyNotificationUserController!.text,
        "userId": userIDController!.text
      };
      var response = await sendNotificationToSpecificUserRemoteDataSource
          .sendNotificationToSpecificUser(data);
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

  viewUsers() async {
    users.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewUsersRemoteDataSource.viewUsers();
    statusRequest = handlingData(response);
    print("-------------View Categories-----\n $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        users.addAll(responseData.map((e) => UsersModel.fromJson(e)));
        for (int i = 0; i < users.length; i++) {
          dropDownUsers.add(SelectedListItem(
              name: users[i].username!, value: users[i].userId.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    viewUsers();
    titleNotificationUserController = TextEditingController();
    bodyNotificationUserController = TextEditingController();
    userIDController = TextEditingController();
    usernameController = TextEditingController();
    super.onInit();
  }
}

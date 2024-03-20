import 'package:admin/controller/notification/search/search_notification_controller.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/data_source/remote/filter/notification/last_month_notification_remote_datasource.dart';
import 'package:admin/data/data_source/remote/filter/notification/last_week_notification_remote_datasource.dart';
import 'package:admin/data/data_source/remote/filter/notification/view_notification_remote_datasource.dart';
import 'package:admin/data/data_source/remote/notification/remove_notification_remote_datasource.dart';
import 'package:admin/data/model/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';

class ViewNotificationController extends SearchNotificationController {
  ViewNotificationRemoteDataSource viewNotificationRemoteDataSource =
      ViewNotificationRemoteDataSource(Get.find());
  FilterOfLastMonthNotificationRemoteDataSource
      filterOfLastMonthNotificationRemoteDataSource =
      FilterOfLastMonthNotificationRemoteDataSource(Get.find());
  FilterOfLastWeekNotificationRemoteDataSource
      filterOfLastWeekNotificationRemoteDataSource =
      FilterOfLastWeekNotificationRemoteDataSource(Get.find());
  DeleteNotificationRemoteDataSource deleteNotificationRemoteDataSource =
      DeleteNotificationRemoteDataSource(Get.find());

  List<NotificationModel> notifications = [];
  StatusRequest statusRequest = StatusRequest.none;
  String selectedProducts = "All";
  List dropItems = [
    "All",
    "Month",
    "Week",
  ];
  List<NotificationModel> lastMonthNotification = [];
  List<NotificationModel> lastWeekNotification = [];
  List<String> selectedItem = [
    "All",
    "Month",
    "Week",
    "High Price",
    "Low Price"
  ];
  int choiceIndex = 0;
  bool isSelected = false;

  viewNotifications() async {
    notifications.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewNotificationRemoteDataSource.fetchNotification();
    statusRequest = handlingData(response);
    print("-------------View Products-----\n $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        notifications
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  filterOfLastMonthOfNotifications() async {
    statusRequest = StatusRequest.loading;
    var response =
        await filterOfLastMonthNotificationRemoteDataSource.filterOfMonth();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        lastMonthNotification
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastWeekOfNotifications() async {
    statusRequest = StatusRequest.loading;
    var response =
        await filterOfLastWeekNotificationRemoteDataSource.filterOfLastWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        lastWeekNotification
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initialDataProducts() async {
    filterOfLastMonthOfNotifications();
    filterOfLastWeekOfNotifications();
  }

  @override
  void onInit() {
    initialDataProducts();
    searchNotificationController = TextEditingController();
    viewNotifications();
    super.onInit();
  }

  onChangedProduct(String productValue) {
    selectedProducts = productValue;
    update();
  }

  onChangeFilter() {
    if (isSelected == false) {
      isSelected = true;
    } else {
      isSelected = false;
    }
    update();
  }

  onSelectedChoiceFilter(bool value, int index) {
    choiceIndex = value ? index : 0;
    update();
  }

  goToEditNotification(NotificationModel notificationModel) {
    Get.toNamed(AppRoutes.editNotification,
        arguments: {"notificationModel": notificationModel});
  }

  deleteNotification(String notificationId) {
    deleteNotificationRemoteDataSource.deleteNotification(notificationId);
    notifications.removeWhere(
        (element) => element.notificationId.toString() == notificationId);
    update();
  }
}

import 'package:admin/data/data_source/remote/search/search_notification_remote_datasource.dart';
import 'package:admin/data/model/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';

class SearchNotificationController extends GetxController {
  SearchNotificationRemoteDataSource searchNotificationRemoteDataSource =
      SearchNotificationRemoteDataSource(Get.find());
  final List<NotificationModel> searchNotificationList = [];
  TextEditingController searchNotificationController = TextEditingController();
  bool isSearchNotification = false;
  late StatusRequest statusRequest;

  checkValueNotifications(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchNotification = false;
    }
    update();
  }

  onSearchNotifications() {
    isSearchNotification = true;
    searchNotification();
    update();
  }

  searchNotification() async {
    statusRequest = StatusRequest.loading;
    var response = await searchNotificationRemoteDataSource
        .searchNotification(searchNotificationController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchNotificationList.clear();
        List responseData = response['data'];
        searchNotificationList
            .addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}

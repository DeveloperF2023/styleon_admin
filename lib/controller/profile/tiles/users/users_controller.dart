import 'package:admin/controller/profile/tiles/users/search/search_users_controller.dart';
import 'package:admin/data/data_source/remote/filter/users/all_last_month_users_remote_datasource.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/enum/status_request.dart';
import '../../../../core/functions/handling_data.dart';
import '../../../../data/data_source/remote/filter/users/all_last_week_users_remote_datasource.dart';
import '../../../../data/data_source/remote/users/view_users_remote_datasource.dart';
import '../../../../data/model/users_model.dart';

class UsersProfileController extends SearchUsersProfileController {
  ViewUsersRemoteDataSource viewUsersRemoteDataSource =
      ViewUsersRemoteDataSource(Get.find());
  FilterOfAllLastMonthUsersRemoteDataSource
      filterOfAllLastMonthUsersRemoteDataSource =
      FilterOfAllLastMonthUsersRemoteDataSource(Get.find());
  FilterOfAllLastWeekUsersRemoteDataSource
      filterOfAllLastWeekUsersRemoteDataSource =
      FilterOfAllLastWeekUsersRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<UsersModel> users = [];
  bool isSelected = false;
  List<UsersModel> lastMonthUsers = [];
  List<UsersModel> lastWeekUsers = [];
  List dropItems = [
    "All",
    "Month",
    "Week",
  ];
  int choiceIndex = 0;

  onChangeFilter() {
    if (isSelected == false) {
      isSelected = true;
    } else {
      isSelected = false;
    }
    update();
  }

  filterOfLastMonthOfUsers() async {
    lastMonthUsers.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await filterOfAllLastMonthUsersRemoteDataSource.filterOfLastMonth();
    statusRequest = handlingData(response);
    print("-------------View last month users-----\n $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        lastMonthUsers.addAll(responseData.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  filterOfLastWeekOfUsers() async {
    lastWeekUsers.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await filterOfAllLastWeekUsersRemoteDataSource.filterOfLastWeek();
    statusRequest = handlingData(response);
    print("-------------View last week users-----\n $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        lastWeekUsers.addAll(responseData.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  viewUsers() async {
    users.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewUsersRemoteDataSource.viewUsers();
    statusRequest = handlingData(response);
    print("-------------View Users-----\n $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        users.addAll(responseData.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  onSelectedChoiceFilter(bool value, int index) {
    choiceIndex = value ? index : 0;
    update();
  }

  String getInitials({required String string, required int limitTo}) {
    var buffer = StringBuffer();
    var split = string.split(' ');
    for (var i = 0; i < (limitTo); i++) {
      buffer.write(split[i][0]);
    }
    return buffer.toString();
  }

  @override
  void onInit() {
    searchUsersController = TextEditingController();
    viewUsers();
    filterOfLastMonthOfUsers();
    filterOfLastWeekOfUsers();
    super.onInit();
  }
}

import 'package:admin/data/data_source/remote/search/search_users_remote_datasource.dart';
import 'package:admin/data/model/users_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/enum/status_request.dart';
import '../../../../../core/functions/handling_data.dart';

class SearchUsersProfileController extends GetxController {
  SearchUsersRemoteDataSource searchUsersRemoteDataSource =
      SearchUsersRemoteDataSource(Get.find());
  final List<UsersModel> searchUsersList = [];
  TextEditingController searchUsersController = TextEditingController();
  bool isSearchUsers = false;
  late StatusRequest statusRequest;

  checkValueUsers(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchUsers = false;
    }
    update();
  }

  onSearchUsers() {
    isSearchUsers = true;
    searchUsers();
    update();
  }

  searchUsers() async {
    statusRequest = StatusRequest.loading;
    var response = await searchUsersRemoteDataSource
        .searchUser(searchUsersController.text);
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        searchUsersList.clear();
        List responseData = response['data'];
        searchUsersList.addAll(responseData.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}

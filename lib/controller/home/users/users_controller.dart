import 'package:admin/data/data_source/remote/count/users_count_remote_datasource.dart';
import 'package:admin/data/data_source/remote/products/fetch_products_remote_datasource.dart';
import 'package:admin/data/data_source/remote/users/view_users_remote_datasource.dart';
import 'package:admin/data/model/products_model.dart';
import 'package:admin/data/model/users_model.dart';
import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/count/categories_count_remote_datasource.dart';
import '../../../data/data_source/remote/filter/users/last_month_users_remote_datasource.dart';
import '../../../data/data_source/remote/filter/users/last_two_week_users_remote_datasource.dart';
import '../../../data/data_source/remote/filter/users/last_week_users_remote_datasource.dart';

class UsersController extends GetxController {
  FilterOfLastMonthUsersRemoteDataSource
      filterOfLastMonthUsersRemoteDataSource =
      FilterOfLastMonthUsersRemoteDataSource(Get.find());
  FilterOfLastWeekUsersRemoteDataSource filterOfLastWeekUsersRemoteDataSource =
      FilterOfLastWeekUsersRemoteDataSource(Get.find());
  FilterOfLastTwoWeekUsersRemoteDataSource
      filterOfLastTwoWeekUsersRemoteDataSource =
      FilterOfLastTwoWeekUsersRemoteDataSource(Get.find());
  CountUsersRemoteDataSource countUsersRemoteDataSource =
      CountUsersRemoteDataSource(Get.find());
  ViewProductsRemoteDataSource viewProductsRemoteDataSource =
      ViewProductsRemoteDataSource(Get.find());
  ViewUsersRemoteDataSource viewUsersRemoteDataSource =
      ViewUsersRemoteDataSource(Get.find());
  int? lastMonthUsers;
  int? lastWeekUsers;
  int? lastTwoWeekUsers;
  List lowPriceProducts = [];
  List highPriceProducts = [];
  List<ProductModel> products = [];
  List<UsersModel> users = [];
  late List<ProductModel> filteredProductsMonth;
  late List<ProductModel> filteredProductsWeek;
  int? countUsers;
  CountCategoriesRemoteDataSource countCategoriesRemoteDataSource =
      CountCategoriesRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  initialDataUsers() async {
    testFilteredProductsOfMonth();
    if (countUsers == 0) {
      countUsers = 0;
    } else {
      countUsers = await countUsersData();
    }

    if (lastMonthUsers == 0) {
      lastMonthUsers = 0;
    } else {
      lastMonthUsers = await filterOfLastMonthOfUsers();
    }

    if (lastWeekUsers == 0) {
      lastWeekUsers = 0;
    } else {
      lastWeekUsers = await filterOfLastWeekOfUsers();
    }
    if (lastTwoWeekUsers == 0) {
      lastTwoWeekUsers = 0;
    } else {
      lastTwoWeekUsers = await filterOfLastTwoWeekOfUsers();
    }
  }

  filterOfLastWeekOfUsers() async {
    var response =
        await filterOfLastWeekUsersRemoteDataSource.filterOfLastWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var lastWeekUsers = 0;
        lastWeekUsers = int.parse(response['data']);
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$lastWeekUsers");
        return lastWeekUsers;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastTwoWeekOfUsers() async {
    var response =
        await filterOfLastTwoWeekUsersRemoteDataSource.filterOfLastTwoWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var lastTwoWeekUsers = 0;
        lastTwoWeekUsers = int.parse(response['data']);
        print("----------------Count Pending ---------------------------");
        print("this is count of last two week users :$lastTwoWeekUsers");
        return lastTwoWeekUsers;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  filterOfLastMonthOfUsers() async {
    var response =
        await filterOfLastMonthUsersRemoteDataSource.filterOfLastMonth();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var lastMonthUsers = '0';
        lastMonthUsers = response['data'].toString();
        print("----------------Count Pending ---------------------------");
        print("this is count of users for month :$lastMonthUsers");
        return lastMonthUsers;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  countUsersData() async {
    statusRequest = StatusRequest.loading;
    var response = await countCategoriesRemoteDataSource.countCategories();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var countCategories = 0;
        countCategories = response['data'];
        print("----------------Count Cart ---------------------------");
        print(countCategories);
        return countCategories;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  testFilteredProductsOfMonth() async {
    var response = await viewProductsRemoteDataSource.fetchProducts();
    statusRequest = handlingData(response);
    print("------Products filtered to test----- $response");
    if (response['status'] == "success") {
      var responseData = response["data"];
      products.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      final now = DateTime.now();
      filteredProductsMonth = products
          .where((product) =>
              product.createdAtProduct!.year == now.year &&
              product.createdAtProduct!.month == now.month)
          .toList();
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final endOfWeek = startOfWeek.add(Duration(days: 6));
      filteredProductsWeek = products
          .where((product) =>
              product.createdAtProduct!.isAfter(startOfWeek) &&
              product.createdAtProduct!.isBefore(endOfWeek))
          .toList();
      print("this is filtered products by week $filteredProductsWeek");
      print("this is filtered products by month $filteredProductsMonth");
      update();
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  fetchUsers() async {
    statusRequest = StatusRequest.loading;
    var response = await viewUsersRemoteDataSource.viewUsers();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        users.addAll(responseData.map((e) => UsersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}

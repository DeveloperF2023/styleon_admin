import 'package:admin/data/model/category_model.dart';
import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/categories/fetch_categories_remote_datasource.dart';
import '../../../data/data_source/remote/count/categories_count_remote_datasource.dart';
import '../../../data/data_source/remote/filter/categories/last_month_categories_remote_datasource.dart';
import '../../../data/data_source/remote/filter/categories/last_two_week_categories_remote_datasource.dart';
import '../../../data/data_source/remote/filter/categories/last_week_categories_remote_datasource.dart';

class CategoriesController extends GetxController {
  FilterOfLastMonthCategoriesRemoteDataSource
      filterOfLastMonthCategoriesRemoteDataSource =
      FilterOfLastMonthCategoriesRemoteDataSource(Get.find());
  FilterOfLastTwoWeekCategoriesRemoteDataSource
      filterOfLastTwoWeekCategoriesRemoteDataSource =
      FilterOfLastTwoWeekCategoriesRemoteDataSource(Get.find());
  FilterOfLastWeekCategoriesRemoteDataSource
      filterOfLastWeekCategoriesRemoteDataSource =
      FilterOfLastWeekCategoriesRemoteDataSource(Get.find());
  int? lastMonthCategories;
  int? lastTwoWeekCategories;
  int? lastWeekCategories;
  List lowPriceProducts = [];
  List highPriceProducts = [];
  List<CategoriesModel> categories = [];
  int? countCategories;
  CountCategoriesRemoteDataSource countCategoriesRemoteDataSource =
      CountCategoriesRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  ViewCategoriesRemoteDataSource viewCategoriesRemoteDataSource =
      ViewCategoriesRemoteDataSource(Get.find());

  filterOfLastMonthOfCategories() async {
    statusRequest = StatusRequest.loading;
    var response =
        await filterOfLastMonthCategoriesRemoteDataSource.filterOfLastMonth();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var lastMonthCategories = 0;
        lastMonthCategories = response['data'];
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$lastMonthCategories");
        return lastMonthCategories;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastTwoWeekOfCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await filterOfLastTwoWeekCategoriesRemoteDataSource
        .filterOfLastTwoWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var lastTwoWeekCategories = 0;
        lastTwoWeekCategories = response['data'];
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$lastTwoWeekCategories");
        return lastTwoWeekCategories;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastWeekOfCategories() async {
    var response =
        await filterOfLastWeekCategoriesRemoteDataSource.filterOfLastWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var lastWeekCategories = 0;
        lastWeekCategories = response['data'];
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$lastWeekCategories");
        return lastWeekCategories;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initialDataCategories() async {
    if (countCategories == 0) {
      countCategories = 0;
    } else {
      countCategories = await countCategoriesData();
    }

    if (lastMonthCategories == 0) {
      lastMonthCategories = 0;
    } else {
      lastMonthCategories = await filterOfLastMonthOfCategories();
    }

    if (lastTwoWeekCategories == 0) {
      lastTwoWeekCategories = 0;
    } else {
      lastTwoWeekCategories = await filterOfLastTwoWeekOfCategories();
    }

    if (lastWeekCategories == 0) {
      lastWeekCategories = 0;
    } else {
      lastWeekCategories = await filterOfLastWeekOfCategories();
    }
  }

  countCategoriesData() async {
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

  fetchCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await viewCategoriesRemoteDataSource.fetchCategories();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        categories.addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}

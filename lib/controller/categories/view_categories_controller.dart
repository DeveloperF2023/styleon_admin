import 'package:admin/controller/categories/search/search_categories_controller.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/data_source/remote/categories/fetch_categories_remote_datasource.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/categories/delete_category_remote_datasource.dart';
import '../../data/data_source/remote/filter/categories/all_last_month_remote_datasource.dart';
import '../../data/data_source/remote/filter/categories/all_last_week_remote_datasource.dart';

class ViewCategoriesController extends SearchCategoriesController {
  ViewCategoriesRemoteDataSource viewCategoriesRemoteDataSource =
      ViewCategoriesRemoteDataSource(Get.find());
  FilterOfAllLastMonthCategoriesRemoteDataSource
      filterOfAllLastMonthCategoriesRemoteDataSource =
      FilterOfAllLastMonthCategoriesRemoteDataSource(Get.find());
  FilterOfAllLastWeekCategoriesRemoteDataSource
      filterOfAllLastWeekCategoriesRemoteDataSource =
      FilterOfAllLastWeekCategoriesRemoteDataSource(Get.find());
  List<CategoriesModel> categories = [];
  DeleteCategoryRemoteDataSource deleteCategoryRemoteDataSource =
      DeleteCategoryRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String selectedCategory = "All";
  List<String> dropCategories = ["All", "Month", "Week"];
  List<CategoriesModel> lastMonthCategories = [];
  List<CategoriesModel> lastWeekCategories = [];
  List<CategoriesModel> lastTwoWeekCategories = [];
  int choiceIndex = 0;
  bool isSelected = false;

  viewCategories() async {
    categories.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewCategoriesRemoteDataSource.fetchCategories();
    statusRequest = handlingData(response);
    print("-------------View Categories-----\n $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        categories.addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  filterOfLastMonthOfCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await filterOfAllLastMonthCategoriesRemoteDataSource
        .filterOfLastMonth();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        lastMonthCategories
            .addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastWeekOfCategories() async {
    statusRequest = StatusRequest.loading;
    var response =
        await filterOfAllLastWeekCategoriesRemoteDataSource.filterOfLastWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        lastWeekCategories
            .addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initialDataCategories() async {
    filterOfLastMonthOfCategories();
    filterOfLastWeekOfCategories();
  }

  @override
  void onInit() {
    initialDataCategories();
    searchCategoriesController = TextEditingController();
    viewCategories();
    super.onInit();
  }

  onChangedCategory(String categoryValue) {
    selectedCategory = categoryValue;
    update();
  }

  deleteCategory(String categoryId, String imageName) {
    deleteCategoryRemoteDataSource.deleteCategory(categoryId, imageName);
    categories
        .removeWhere((element) => element.categoryId.toString() == categoryId);
    update();
  }

  goToEditCategory(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.editCategory, arguments: {
      "categoriesModel": categoriesModel,
    });
  }

  onSelectedChoiceFilter(bool value, int index) {
    choiceIndex = value ? index : 0;
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
}

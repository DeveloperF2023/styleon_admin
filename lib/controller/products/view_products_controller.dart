import 'package:admin/controller/products/search/search_products_controller.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/data_source/remote/filter/products/all_last_month_remote_datasource.dart';
import 'package:admin/data/data_source/remote/filter/products/all_last_week_remote_datasource.dart';
import 'package:admin/data/data_source/remote/products/fetch_products_remote_datasource.dart';
import 'package:admin/data/model/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/filter/products/high_price_products_remote_datasource.dart';
import '../../data/data_source/remote/filter/products/low_price_products_remote_datasource.dart';
import '../../data/data_source/remote/products/delete_products_remote_datasource.dart';

class ViewProductController extends SearchProductController {
  ViewProductsRemoteDataSource viewProductsRemoteDataSource =
      ViewProductsRemoteDataSource(Get.find());
  FilterOfAllLastMonthProductsRemoteDataSource
      filterOfAllLastMonthProductsRemoteDataSource =
      FilterOfAllLastMonthProductsRemoteDataSource(Get.find());
  FilterOfAllLastWeekProductsRemoteDataSource
      filterOfAllLastWeekProductsRemoteDataSource =
      FilterOfAllLastWeekProductsRemoteDataSource(Get.find());
  FilterOfLowPriceProductsRemoteDataSource
      filterOfLowPriceProductsRemoteDataSource =
      FilterOfLowPriceProductsRemoteDataSource(Get.find());
  FilterOfHighPriceProductsRemoteDataSource
      filterOfHighPriceProductsRemoteDataSource =
      FilterOfHighPriceProductsRemoteDataSource(Get.find());
  DeleteProductsRemoteDataSource deleteProductsRemoteDataSource =
      DeleteProductsRemoteDataSource(Get.find());
  List<ProductModel> products = [];
  StatusRequest statusRequest = StatusRequest.none;
  String selectedProducts = "All";
  List dropItems = [
    "All",
    "Month",
    "Week",
    "High To Low Price",
    "Low To High Price"
  ];
  List<ProductModel> lastMonthProducts = [];
  List<ProductModel> lastWeekProducts = [];
  List<ProductModel> lowPriceProducts = [];
  List<ProductModel> highPriceProducts = [];
  List<String> selectedItem = [
    "All",
    "Month",
    "Week",
    "High Price",
    "Low Price"
  ];
  int choiceIndex = 0;
  bool isSelected = false;

  viewProducts() async {
    products.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewProductsRemoteDataSource.fetchProducts();
    statusRequest = handlingData(response);
    print("-------------View Products-----\n $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        products.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  filterOfHighPriceOfProducts() async {
    highPriceProducts.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await filterOfHighPriceProductsRemoteDataSource.filterOfHighPrice();
    statusRequest = handlingData(response);
    print("********Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        highPriceProducts
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLowPriceOfProducts() async {
    lowPriceProducts.clear();
    statusRequest = StatusRequest.loading;
    var response =
        await filterOfLowPriceProductsRemoteDataSource.filterOfLowPrice();
    statusRequest = handlingData(response);
    print("****** Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        lowPriceProducts
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  filterOfLastMonthOfProducts() async {
    statusRequest = StatusRequest.loading;
    var response =
        await filterOfAllLastMonthProductsRemoteDataSource.filterOfLastMonth();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        lastMonthProducts
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastWeekOfProducts() async {
    statusRequest = StatusRequest.loading;
    var response =
        await filterOfAllLastWeekProductsRemoteDataSource.filterOfLastWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        lastWeekProducts
            .addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initialDataProducts() async {
    filterOfHighPriceOfProducts();
    filterOfLowPriceOfProducts();
    filterOfLastMonthOfProducts();
    filterOfLastWeekOfProducts();
  }

  @override
  void onInit() {
    initialDataProducts();
    searchProductsController = TextEditingController();
    viewProducts();
    super.onInit();
  }

  onChangedProduct(String productValue) {
    selectedProducts = productValue;
    update();
  }

  deleteProduct(String productId, String imageName) {
    deleteProductsRemoteDataSource.deleteProducts(productId, imageName);
    products
        .removeWhere((element) => element.productId.toString() == productId);
    update();
  }

  goToEditProduct(ProductModel productModel) {
    Get.toNamed(AppRoutes.editProduct,
        arguments: {"productModel": productModel});
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
}

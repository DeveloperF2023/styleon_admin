import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/count/products_count_remote_datasource.dart';
import '../../../data/data_source/remote/filter/products/high_price_products_remote_datasource.dart';
import '../../../data/data_source/remote/filter/products/low_price_products_remote_datasource.dart';
import '../../../data/data_source/remote/home/products/view_products_remote_datasource.dart';
import '../../../data/model/products_model.dart';

class HomeProductsController extends GetxController {
  FilterOfLowPriceProductsRemoteDataSource
      filterOfLowPriceProductsRemoteDataSource =
      FilterOfLowPriceProductsRemoteDataSource(Get.find());
  FilterOfHighPriceProductsRemoteDataSource
      filterOfHighPriceProductsRemoteDataSource =
      FilterOfHighPriceProductsRemoteDataSource(Get.find());
  CountProductRemoteDataSource countProductRemoteDataSource =
      CountProductRemoteDataSource(Get.find());
  FetchProductsRemoteDataSource fetchProductsRemoteDataSource =
      FetchProductsRemoteDataSource(Get.find());
  int? lastMonthProducts;
  int? lastWeekProducts;
  int? lastTwoWeekProducts;
  List lowPriceProducts = [];
  List highPriceProducts = [];
  List<ProductModel> products = [];
  String selectedItem = "All";
  String selectedProducts = "All";
  List<String> dropItems = ["All", "Month", "2 Week", "Week"];
  List<String> dropProducts = ["All", "High Price", "Low Price"];
  int? countProducts;
  StatusRequest statusRequest = StatusRequest.none;

  ///Filter categories per month, 2 week, week
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
        highPriceProducts.addAll(response['data']);
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
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        lowPriceProducts.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  countProductsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await countProductRemoteDataSource.countProducts();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var countProducts = 0;
        countProducts = response['data'];
        print("----------------Count Cart ---------------------------");
        print(countProducts);
        return countProducts;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  fetchProducts() async {
    statusRequest = StatusRequest.loading;
    var response = await fetchProductsRemoteDataSource.fetchData();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        products.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initialDataProducts() async {
    if (countProducts == 0) {
      countProducts = 0;
    } else {
      countProducts = await countProductsData();
    }
  }
}

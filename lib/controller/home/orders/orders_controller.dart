import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/count/accepted_order_remote_datasource.dart';
import '../../../data/data_source/remote/count/archive_order_remote_datasource.dart';
import '../../../data/data_source/remote/count/categories_count_remote_datasource.dart';
import '../../../data/data_source/remote/count/orders_count_remote_datasource.dart';
import '../../../data/data_source/remote/count/pending_count_remote_datasource.dart';
import '../../../data/data_source/remote/filter/orders/all_last_month_orders_remote_datasource.dart';
import '../../../data/data_source/remote/filter/orders/all_last_two_week_orders_remote_datasource.dart';
import '../../../data/data_source/remote/filter/orders/all_last_week_orders_remote_datasource.dart';
import '../../../data/data_source/remote/filter/orders/last_month_orders_remote_datasource.dart';
import '../../../data/data_source/remote/filter/orders/last_two_week_orders_remote_datasource.dart';
import '../../../data/data_source/remote/filter/orders/last_week_orders_remote_datasource.dart';
import '../../../data/data_source/remote/home/orders/fetch_orders_remote_datasource.dart';
import '../../../data/data_source/remote/orders/count_orders_remote_datasource.dart';
import '../../../data/model/orders_model.dart';

class OrdersController extends GetxController {
  FilterOfLastMonthOrdersRemoteDataSource
      filterOfLastMonthOrdersRemoteDataSource =
      FilterOfLastMonthOrdersRemoteDataSource(Get.find());
  FilterOfLastWeekOrdersRemoteDataSource
      filterOfLastWeekOrdersRemoteDataSource =
      FilterOfLastWeekOrdersRemoteDataSource(Get.find());
  FilterOfLastTwoWeekOrdersRemoteDataSource
      filterOfLastTwoWeekOrdersRemoteDataSource =
      FilterOfLastTwoWeekOrdersRemoteDataSource(Get.find());
  FilterOfAllLastMonthOrdersRemoteDataSource
      filterOfAllLastMonthOrdersRemoteDataSource =
      FilterOfAllLastMonthOrdersRemoteDataSource(Get.find());
  FilterOfAllLastTwoWeekOrdersRemoteDataSource
      filterOfAllLastTwoWeekOrdersRemoteDataSource =
      FilterOfAllLastTwoWeekOrdersRemoteDataSource(Get.find());
  FilterOfAllLastWeekOrdersRemoteDataSource
      filterOfAllLastWeekOrdersRemoteDataSource =
      FilterOfAllLastWeekOrdersRemoteDataSource(Get.find());
  CountOrdersRemoteDataSource countOrdersRemoteDataSource =
      CountOrdersRemoteDataSource(Get.find());
  CountPendingOrdersRemoteDataSource countPendingOrdersRemoteDataSource =
      CountPendingOrdersRemoteDataSource(Get.find());
  CountAcceptedOrdersRemoteDataSource countAcceptedOrdersRemoteDataSource =
      CountAcceptedOrdersRemoteDataSource(Get.find());
  CountArchiveOrdersRemoteDataSource countArchiveOrdersRemoteDataSource =
      CountArchiveOrdersRemoteDataSource(Get.find());
  FetchOrdersRemoteDataSource fetchOrdersRemoteDataSource =
      FetchOrdersRemoteDataSource(Get.find());
  FetchCountOrdersRemoteDataSource fetchCountOrdersRemoteDataSource =
      FetchCountOrdersRemoteDataSource(Get.find());
  int? lastMonthOrders;
  int? lastWeekOrders;
  List orders = [];
  List<OrdersModel> orderModel = [];
  List allLastMonthOrders = [];
  List allLastWeekOrders = [];
  List allLastTwoWeekOrders = [];
  int? lastTwoWeekOrders;
  int? countOrders;
  int? countPendingOrders;
  int? countAcceptedOrders;
  int? countArchiveOrders;
  List<String> dropItems = ["All", "Month", "2 Week", "Week"];
  String selectedItem = "All";
  CountCategoriesRemoteDataSource countCategoriesRemoteDataSource =
      CountCategoriesRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  initialDataOrders() async {
    if (countOrders == 0) {
      countOrders = 0;
    } else {
      countOrders = await countOrdersData();
    }

    if (countPendingOrders == 0) {
      countPendingOrders = 0;
    } else {
      countPendingOrders = await countPendingOrdersData();
    }

    if (countAcceptedOrders == 0) {
      countAcceptedOrders = 0;
    } else {
      countAcceptedOrders = await countAcceptedOrdersData();
    }

    if (countArchiveOrders == 0) {
      countArchiveOrders = 0;
    } else {
      countArchiveOrders = await countArchiveOrdersData();
    }
    if (lastMonthOrders == 0) {
      lastWeekOrders = 0;
    } else {
      lastWeekOrders = await filterOfLastWeekOfOrders();
    }
    if (lastTwoWeekOrders == 0) {
      lastTwoWeekOrders = 0;
    } else {
      lastTwoWeekOrders = await filterOfLastTwoWeekOfOrders();
    }
  }

  countPendingOrdersData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await countPendingOrdersRemoteDataSource.countPendingOrders();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var countPendingOrders = 0;
        countPendingOrders = response['data'];
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$countPendingOrders");
        return countPendingOrders;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  countAcceptedOrdersData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await countAcceptedOrdersRemoteDataSource.countAcceptedOrders();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var countAcceptedOrders = 0;
        countAcceptedOrders = response['data'];
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$countAcceptedOrders");
        return countAcceptedOrders;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  countArchiveOrdersData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await countArchiveOrdersRemoteDataSource.countArchiveOrders();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var countArchiveOrders = 0;
        countArchiveOrders = response['data'];
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$countArchiveOrders");
        return countArchiveOrders;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastMonthOfOrders() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await filterOfLastMonthOrdersRemoteDataSource.filterOfLastMonth();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var lastMonthOrders = 0;
        lastMonthOrders = int.parse(response['data']);
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$lastMonthOrders");
        return lastMonthOrders;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  countOrdersData() async {
    statusRequest = StatusRequest.loading;
    var response = await countOrdersRemoteDataSource.countOrders();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var countOrders = 0;
        countOrders = response['data'];
        print("----------------Count Cart ---------------------------");
        print(countOrders);
        return countOrders;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastTwoWeekOfOrders() async {
    statusRequest = StatusRequest.loading;
    var response =
        await filterOfLastTwoWeekOrdersRemoteDataSource.filterOfLastTwoWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var lastTwoWeekOrders = 0;
        lastTwoWeekOrders = response['data'];
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$lastTwoWeekOrders");
        return lastTwoWeekOrders;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  filterOfLastWeekOfOrders() async {
    var response =
        await filterOfLastWeekOrdersRemoteDataSource.filterOfLastWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        var lastWeekOrders = 0;
        lastWeekOrders = response['data'];
        print("----------------Count Pending ---------------------------");
        print("this is count of pending :$lastWeekOrders");
        return lastWeekOrders;
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  fetchOrders() async {
    statusRequest = StatusRequest.loading;
    var response = await fetchOrdersRemoteDataSource.fetchOrders();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        orders.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfAllLastMonthOrders() async {
    allLastMonthOrders.clear();
    var response =
        await filterOfAllLastMonthOrdersRemoteDataSource.filterOfLastMonth();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(
            "----------------all last month------------- \n ${response['data']}");
        allLastMonthOrders.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfAllLastWeekOrders() async {
    allLastWeekOrders.clear();
    var response =
        await filterOfAllLastWeekOrdersRemoteDataSource.filterOfLastWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(
            "----------------all last week------------- \n ${response['data']}");
        allLastWeekOrders.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfAllLastTwoWeekOrders() async {
    allLastTwoWeekOrders.clear();
    var response = await filterOfAllLastTwoWeekOrdersRemoteDataSource
        .filterOfLastTwoWeek();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(
            "----------------all last two week------------- \n ${response['data']}");
        allLastTwoWeekOrders.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  fetchOrdersOfHome() async {
    statusRequest = StatusRequest.loading;
    var response = await fetchCountOrdersRemoteDataSource.fetchOrders();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        orderModel.addAll(responseData.map((e) => OrdersModel.fromJson(e)));
        print("this is order model $orderModel");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}

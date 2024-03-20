import 'package:admin/controller/orders/search/search_order_controller.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/model/delivery_order_model.dart';
import 'package:admin/data/model/rating_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/filter/orders/accepted_orders_remote_datasource.dart';
import '../../data/data_source/remote/filter/orders/archive_orders_remote_datasource.dart';
import '../../data/data_source/remote/filter/orders/pending_orders_remote_datasource.dart';
import '../../data/data_source/remote/orders/fetch_orders_remote_datasource.dart';
import '../../presentation/widgets/global/text_app.dart';

class ViewOrdersController extends SearchOrderController {
  ViewOrdersRemoteDataSource viewOrdersRemoteDataSource =
      ViewOrdersRemoteDataSource(Get.find());
  FilterOfPendingOrdersRemoteDataSource filterOfPendingOrdersRemoteDataSource =
      FilterOfPendingOrdersRemoteDataSource(Get.find());
  FilterOfAcceptedOrdersRemoteDataSource
      filterOfAcceptedOrdersRemoteDataSource =
      FilterOfAcceptedOrdersRemoteDataSource(Get.find());
  FilterOfArchiveOrdersRemoteDataSource filterOfArchiveOrdersRemoteDataSource =
      FilterOfArchiveOrdersRemoteDataSource(Get.find());
  List<RatingDetailModel> orders = [];
  StatusRequest statusRequest = StatusRequest.none;
  String selectedOrder = "All";
  List<String> dropOrders = ["All", "Pending", "Accepted", "Archive"];
  List<DeliveryOrderModel> pendingOrders = [];
  List<DeliveryOrderModel> acceptedOrders = [];
  List<DeliveryOrderModel> archiveOrders = [];
  List<String> ordersStatus = ["Pending", "Accepted", "Archive"];
  int rowCount = 0;
  PaginationController? paginationController;
  bool isSearchOrders = false;
  TabController? tabController;

  @override
  checkValueOrders(value) {
    if (value!.isEmpty) {
      statusRequest = StatusRequest.none;
      isSearchOrders = false;
    }
    update();
  }

  viewOrders() async {
    orders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewOrdersRemoteDataSource.fetchOrders();
    statusRequest = handlingData(response);
    print("-------------View Orders-----\n $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        orders.addAll(responseData.map((e) => RatingDetailModel.fromJson(e)));
        paginationController = PaginationController(
          rowCount: orders.length,
          rowsPerPage: 10,
        );
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  filterOfPendingOrders() async {
    pendingOrders.clear();
    var response =
        await filterOfPendingOrdersRemoteDataSource.filterOfPending();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(
            "----------------Pending Orders------------- \n ${response['data']}");
        List responseData = response['data'];
        pendingOrders
            .addAll(responseData.map((e) => DeliveryOrderModel.fromJson(e)));
      } else {
        TextApp(text: "Error");
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfAcceptedOrders() async {
    acceptedOrders.clear();
    var response =
        await filterOfAcceptedOrdersRemoteDataSource.filterOfAccepted();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(
            "----------------all last week------------- \n ${response['data']}");
        List responseData = response['data'];
        acceptedOrders
            .addAll(responseData.map((e) => DeliveryOrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfArchiveOrders() async {
    archiveOrders.clear();
    var response =
        await filterOfArchiveOrdersRemoteDataSource.filterOfArchive();
    statusRequest = handlingData(response);
    print(
        "------------------------------------------------------------------------ Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        print(
            "----------------all last two week------------- \n ${response['data']}");
        List responseData = response['data'];
        archiveOrders
            .addAll(responseData.map((e) => DeliveryOrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initialDataProducts() async {
    filterOfPendingOrders();
    filterOfAcceptedOrders();
    filterOfArchiveOrders();
  }

  @override
  void onInit() {
    initialDataProducts();
    viewOrders();
    searchOrdersController = TextEditingController();

    super.onInit();
  }

  onChangedOrder(String orderValue) {
    selectedOrder = orderValue;
    update();
  }

  goToDetailOrder(RatingDetailModel orderModel) {
    Get.toNamed(AppRoutes.orderDetail, arguments: {
      "orderModel": orderModel,
    });
  }
}

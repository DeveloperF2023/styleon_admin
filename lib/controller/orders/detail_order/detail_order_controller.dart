import 'dart:async';

import 'package:admin/data/data_source/remote/orders/detail_order_remote_datasource.dart';
import 'package:admin/data/data_source/remote/orders/fetch_rating_remote_datasource.dart';
import 'package:admin/data/model/delivery_order_model.dart';
import 'package:admin/data/model/rating_detail_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';

abstract class OrderDetailsController extends GetxController {
  typeOfOrder(String value);
  typeOfPayment(String value);
  statusOfOrder(String value);
  selectArrowButton();
  selectOpenItem();
  fetchOrders();
  fetchRating();
}

class OrderDetailsControllerImpl extends OrderDetailsController {
  RatingDetailModel? orderModel;
  bool isOpen = false;
  bool isOpenItem = false;
  double? latitude;
  double? longitude;
  List<Marker> markers = [];
  Completer<GoogleMapController>? controllerMap;
  CameraPosition? kGooglePlex;
  DetailOrdersRemoteDataSource detailOrderRemoteDataSource =
      DetailOrdersRemoteDataSource(Get.find());
  ViewRatingRemoteDataSource viewRatingRemoteDataSource =
      ViewRatingRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List<DeliveryOrderModel> data = [];
  List<RatingDetailModel> rating = [];

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    print("this is order model $orderModel");
    initialData();
    fetchOrders();
    fetchRating();
    super.onInit();
  }

  initialData() {
    if (orderModel!.ordersType.toString() != "1") {
      kGooglePlex = CameraPosition(
          target: LatLng(
              orderModel!.addressLat ?? 0.0, orderModel!.addressLong ?? 0.0),
          zoom: 13);
      markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(
              orderModel!.addressLat ?? 0.0, orderModel!.addressLong ?? 0.0)));
      controllerMap = Completer<GoogleMapController>();
    } else {
      print(kGooglePlex);
    }
  }

  @override
  selectArrowButton() {
    if (isOpen == false) {
      isOpen = true;
    } else {
      isOpen = false;
    }
    update();
  }

  @override
  selectOpenItem() {
    if (isOpenItem == false) {
      isOpenItem = true;
    } else {
      isOpenItem = false;
    }
    update();
  }

  @override
  statusOfOrder(value) {
    if (value == "0") {
      return "Pending approval";
    } else if (value == "1") {
      return "Order Processing";
    } else if (value == "2") {
      return "Dispatched";
    } else if (value == "3") {
      return "Out for Delivery";
    } else {
      return "Delivered";
    }
  }

  @override
  typeOfOrder(value) {
    if (value == "0") {
      return "Delivery";
    } else {
      return "Receive";
    }
  }

  @override
  typeOfPayment(value) {
    if (value == "0") {
      return "Cash on Delivery";
    } else {
      return "Credit Card Payment";
    }
  }

  @override
  fetchOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await detailOrderRemoteDataSource
        .detailOrder(orderModel!.ordersId.toString());
    statusRequest = handlingData(response);
    print("*-*-*-*-*-Data Orders*-*-*-*-*-*-Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      print("order model ${orderModel!.ordersId}");
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => DeliveryOrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
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
  fetchRating() async {
    rating.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewRatingRemoteDataSource.fetchRating();
    statusRequest = handlingData(response);
    print("*-*-*-*-*-Data Orders*-*-*-*-*-*-Controller $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      print("order model ${orderModel!.ordersId}");
      if (response['status'] == "success") {
        List responseData = response['data'];
        rating.addAll(responseData.map((e) => RatingDetailModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}

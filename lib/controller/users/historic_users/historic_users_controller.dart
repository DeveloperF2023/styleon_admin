import 'dart:async';

import 'package:admin/data/data_source/remote/users/historic_users_remote_datasource.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';

class HistoricUsersController extends GetxController {
  HistoricUsersRemoteDataSource historicUsersRemoteDataSource =
      HistoricUsersRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  int? userId;
  List favorites = [];
  List orders = [];
  List addresses = [];
  List users = [];
  String? username;
  Completer<GoogleMapController>? controllerMap;
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
  double? addressLat;
  double? addressLong;

  @override
  void onInit() {
    userId = Get.arguments['userId'];
    username = Get.arguments['username'];
    addressLat = Get.arguments['addressLat'];
    addressLong = Get.arguments['addressLong'];
    fetchHistoricOfUser();
    initialData();
    super.onInit();
  }

  fetchHistoricOfUser() async {
    statusRequest = StatusRequest.loading;
    var response =
        await historicUsersRemoteDataSource.historicUsers(userId!.toString());
    statusRequest = handlingData(response);
    print("----------Fetch Home Data $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        favorites.addAll(response['favorite']["data"]);
        orders.addAll(response['orders']["data"]);
        addresses.addAll(response['address']["data"]);
        users.addAll(response['users']["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
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

  statusOfProduct(value) {
    if (value == 0) {
      return "Hidden";
    } else {
      return "Active";
    }
  }

  initialData() {
    kGooglePlex = CameraPosition(
        target: LatLng(addressLat ?? 0.0, addressLong ?? 0.0), zoom: 10.23);
    markers.add(Marker(
        markerId: const MarkerId("1"),
        position: LatLng(addressLat ?? 0.0, addressLong ?? 0.0)));
    controllerMap = Completer<GoogleMapController>();
  }
}

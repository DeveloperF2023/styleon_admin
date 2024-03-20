import 'package:admin/core/enum/status_request.dart';
import 'package:admin/data/data_source/remote/orders/approve_orders_remote_datasource.dart';
import 'package:admin/data/data_source/remote/orders/done_prepared_orders_remote_datasource.dart';
import 'package:admin/data/data_source/remote/products/delete_products_remote_datasource.dart';
import 'package:admin/data/data_source/remote/products/fetch_products_remote_datasource.dart';
import 'package:admin/data/model/delivery_order_model.dart';
import 'package:admin/data/model/products_model.dart';
import 'package:get/get.dart';
import '../../core/functions/handling_data.dart';

class ApproveOrderController extends GetxController{
  ApproveOrdersRemoteDataSource approveOrdersRemoteDataSource = ApproveOrdersRemoteDataSource(Get.find());
  DonePreparedOrdersRemoteDataSource donePreparedOrdersRemoteDataSource = DonePreparedOrdersRemoteDataSource(Get.find());
  List<DeliveryOrderModel> acceptedOrders = [];
  List<DeliveryOrderModel> donePreparedOrders = [];
  StatusRequest statusRequest = StatusRequest.none;

  paymentMethodOfOrder(String value){
    if(value == "0"){
      return "Cash";
    }else if(value == "1"){
      return "Credit Card";
    }
  }

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

  typeOfOrder(value) {
    if (value == "0") {
      return "Delivery";
    } else {
      return "Receive";
    }
  }

  approveOrder(String orderId, String userId)async{
    acceptedOrders.clear();
    statusRequest  = StatusRequest.loading;
    update();
    var response = await approveOrdersRemoteDataSource.approveOrders(userId, orderId);
    statusRequest = handlingData(response);
    print("-------------View Orders-----\n $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        List responseData = response['data'];
        acceptedOrders.addAll(responseData.map((e) => DeliveryOrderModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  donePreparedOrder(String orderId, String userId,String orderType)async{
    donePreparedOrders.clear();
    statusRequest  = StatusRequest.loading;
    update();
    var response = await donePreparedOrdersRemoteDataSource.donePreparedOrders(userId, orderId,orderType);
    statusRequest = handlingData(response);
    print("-------------View Orders-----\n $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {

      }else{
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }
}
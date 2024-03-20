import 'package:admin/data/data_source/remote/search/search_orders_remote_datasource.dart';
import 'package:admin/data/model/delivery_order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/search/search_product_remote_datasource.dart';
import '../../../data/model/products_model.dart';
import '../../../data/model/rating_detail_model.dart';
import '../../../presentation/widgets/global/text_app.dart';

class SearchOrderController extends GetxController{
  SearchOrdersRemoteDataSource searchOrdersRemoteDataSource = SearchOrdersRemoteDataSource(Get.find());
  final List<DeliveryOrderModel> searchOrdersList = [];
  TextEditingController searchOrdersController = TextEditingController();
  late StatusRequest statusRequest;
  bool isSearchOrders = false;


  checkValueOrders(value) {
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
      isSearchOrders = false;
    }
    update();
  }


  onSearchOrders() {
    isSearchOrders = true;
    searchOrders();
    update();
  }

  searchOrders() async{
    statusRequest  = StatusRequest.loading;
    var response = await searchOrdersRemoteDataSource.searchOrders(searchOrdersController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        searchOrdersList.clear();
        List responseData = response['data'];
        searchOrdersList.addAll(responseData.map((e) => DeliveryOrderModel.fromJson(e)));
      }else{
        Get.rawSnackbar(
          backgroundColor: AppColors.grey50!,
          duration: const Duration(seconds: 7),
          messageText: TextApp(
            text:
            "${searchOrdersController.text} Does not exist",
            color: AppColors.textColor,
          ),
          titleText: TextApp(
            text: "Not Found",
            color: AppColors.textColor,
          ),
        );
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}
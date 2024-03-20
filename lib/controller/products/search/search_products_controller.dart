import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/search/search_product_remote_datasource.dart';
import '../../../data/model/products_model.dart';

class SearchProductController extends GetxController{
  SearchProductsRemoteDataSource searchProductsRemoteDataSource = SearchProductsRemoteDataSource(Get.find());
  final List<ProductModel> searchProductsList = [];
  TextEditingController searchProductsController = TextEditingController();
  bool isSearchProducts = false;
  late StatusRequest statusRequest;

  checkValueProducts(value) {
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
      isSearchProducts = false;
    }
    update();
  }


  onSearchProducts() {
    isSearchProducts = true;
    searchProducts();
    update();
  }

  searchProducts() async{
    statusRequest  = StatusRequest.loading;
    var response = await searchProductsRemoteDataSource.searchProduct(searchProductsController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        searchProductsList.clear();
        List responseData = response['data'];
        searchProductsList.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}
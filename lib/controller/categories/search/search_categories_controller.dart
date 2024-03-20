import 'package:admin/data/data_source/remote/search/search_category_remote_datasource.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/search/search_product_remote_datasource.dart';
import '../../../data/model/products_model.dart';

class SearchCategoriesController extends GetxController{
  SearchCategoriesRemoteDataSource searchCategoriesRemoteDataSource = SearchCategoriesRemoteDataSource(Get.find());
  final List<CategoriesModel> searchCategoriesList = [];
  TextEditingController searchCategoriesController = TextEditingController();
  bool isSearchCategories = false;
  late StatusRequest statusRequest;

  checkValueCategories(value) {
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
      isSearchCategories = false;
    }
    update();
  }


  onSearchCategories() {
    isSearchCategories = true;
    searchCategories();
    update();
  }

  searchCategories() async{
    statusRequest  = StatusRequest.loading;
    var response = await searchCategoriesRemoteDataSource.searchCategory(searchCategoriesController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        searchCategoriesList.clear();
        List responseData = response['data'];
        searchCategoriesList.addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

}
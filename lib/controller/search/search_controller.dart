import 'package:admin/data/data_source/remote/search/search_brands_remote_datasource.dart';
import 'package:admin/data/data_source/remote/search/search_category_remote_datasource.dart';
import 'package:admin/data/data_source/remote/search/search_coupon_remote_datasource.dart';
import 'package:admin/data/data_source/remote/search/search_delivery_remote_datasource.dart';
import 'package:admin/data/data_source/remote/search/search_notification_remote_datasource.dart';
import 'package:admin/data/data_source/remote/search/search_orders_remote_datasource.dart';
import 'package:admin/data/model/brands_model.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:admin/data/model/coupon_model.dart';
import 'package:admin/data/model/delivery_model.dart';
import 'package:admin/data/model/delivery_order_model.dart';
import 'package:admin/data/model/notification_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/enum/status_request.dart';
import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/search/search_product_remote_datasource.dart';
import '../../data/model/products_model.dart';

class SearchMixController extends GetxController{
  SearchProductsRemoteDataSource searchProductsRemoteDataSource = SearchProductsRemoteDataSource(Get.find());
  SearchCategoriesRemoteDataSource searchCategoriesRemoteDataSource  = SearchCategoriesRemoteDataSource(Get.find());
  SearchBrandsRemoteDataSource searchBrandsRemoteDataSource = SearchBrandsRemoteDataSource(Get.find());
  SearchCouponRemoteDataSource searchCouponRemoteDataSource = SearchCouponRemoteDataSource(Get.find());
  SearchDeliveryRemoteDataSource searchDeliveryRemoteDataSource = SearchDeliveryRemoteDataSource(Get.find());
  SearchNotificationRemoteDataSource searchNotificationRemoteDataSource = SearchNotificationRemoteDataSource(Get.find());
  SearchOrdersRemoteDataSource searchOrdersRemoteDataSource = SearchOrdersRemoteDataSource(Get.find());
  final List<ProductModel> searchList = [];
  final List<CategoriesModel> categoriesList=[];
  final List<BrandsModel> brandsList = [];
  final List<CouponModel> couponList = [];
  final List<DeliveryModel> deliveryList = [];
  final List<NotificationModel> notificationList = [];
  final List<DeliveryOrderModel> ordersList = [];
 TextEditingController searchController = TextEditingController();
 TextEditingController searchCategoriesController = TextEditingController();
  TextEditingController searchBrandController = TextEditingController();
  TextEditingController searchCouponController = TextEditingController();
  TextEditingController searchDeliveriesController = TextEditingController();
  TextEditingController searchNotificationController =TextEditingController();
  TextEditingController searchOrdersController = TextEditingController();
  TextEditingController searchProductsController = TextEditingController();
  bool isSearch = false;
  bool isSearchCategories = false;
  bool isSearchBrands = false;
  bool isSearchCoupon = false;
  bool isSearchDelivery = false;
  bool isSearchNotification = false;
  bool isSearchOrders = false;
  late StatusRequest statusRequest;

  checkValue(value) {
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
          isSearch = false;
    }
    update();
  }

  checkValueCategory(value){
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
      isSearchCategories = false;
    }
    update();
  }

  checkValueBrands(value){
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
      isSearchBrands = false;
    }
    update();
  }

  checkValueCoupon(value){
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
      isSearchCoupon = false;
    }
    update();
  }

  checkValueDelivery(value){
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
      isSearchDelivery = false;
    }
    update();
  }

  checkValueNotification(value) {
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
      isSearchNotification = false;
    }
    update();
  }

  checkValueOrders(value) {
    if(value!.isEmpty){
      statusRequest = StatusRequest.none;
      isSearchOrders = false;
    }
    update();
  }



  onSearchProducts() {
    isSearch = true;
    searchProducts();
    update();
  }

  onSearchCategories() {
    isSearchCategories = true;
    searchCategories();
    update();
  }

  onSearchBrands(){
    isSearchBrands = true;
    searchBrands();
    update();
  }

  onSearchCoupon(){
    isSearchCoupon = true;
    searchCoupon();
    update();
  }

  onSearchDelivery(){
    isSearchDelivery = true;
    searchDelivery();
    update();
  }

  onSearchNotification() {
    isSearchNotification = true;
    searchNotification();
    update();
  }

  onSearchOrders() {
    isSearchOrders = true;
    searchOrders();
    update();
  }



  searchProducts() async{
    statusRequest  = StatusRequest.loading;
    var response = await searchProductsRemoteDataSource.searchProduct(searchController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        searchList.clear();
        List responseData = response['data'];
        searchList.addAll(responseData.map((e) => ProductModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchCategories()async{
    statusRequest  = StatusRequest.loading;
    var response = await searchCategoriesRemoteDataSource.searchCategory(searchCategoriesController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        categoriesList.clear();
        List responseData = response['data'];
        categoriesList.addAll(responseData.map((e) => CategoriesModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchBrands()async{
    statusRequest  = StatusRequest.loading;
    var response = await searchBrandsRemoteDataSource.searchBrand(searchBrandController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        brandsList.clear();
        List responseData = response['data'];
        brandsList.addAll(responseData.map((e) => BrandsModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchCoupon()async{
    statusRequest  = StatusRequest.loading;
    var response = await searchCouponRemoteDataSource.searchCoupon(searchCouponController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        couponList.clear();
        List responseData = response['data'];
        couponList.addAll(responseData.map((e) => CouponModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchDelivery()async{
    statusRequest  = StatusRequest.loading;
    var response = await searchDeliveryRemoteDataSource.searchDelivery(searchDeliveriesController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        deliveryList.clear();
        List responseData = response['data'];
        deliveryList.addAll(responseData.map((e) => DeliveryModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchNotification()async{
    statusRequest  = StatusRequest.loading;
    var response = await searchNotificationRemoteDataSource.searchNotification(searchNotificationController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        notificationList.clear();
        List responseData = response['data'];
        notificationList.addAll(responseData.map((e) => NotificationModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  searchOrders()async{
    statusRequest  = StatusRequest.loading;
    var response = await searchOrdersRemoteDataSource.searchOrders(searchOrdersController.text);
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        ordersList.clear();
        List responseData = response['data'];
        ordersList.addAll(responseData.map((e) => DeliveryOrderModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
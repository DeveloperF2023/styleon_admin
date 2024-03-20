import 'package:admin/controller/home/brands/brands_controller.dart';
import 'package:admin/controller/home/categories/categories_controller.dart';
import 'package:admin/controller/home/coupon/coupon_controller.dart';
import 'package:admin/controller/home/delivery/delivery_controller.dart';
import 'package:admin/controller/home/notification/notification.dart';
import 'package:admin/controller/home/orders/orders_controller.dart';
import 'package:admin/controller/home/products/products_controller.dart';
import 'package:admin/controller/home/users/users_controller.dart';
import 'package:admin/core/enum/status_request.dart';
import 'package:admin/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data.dart';
import '../../data/data_source/remote/home/home_remote_datasource.dart';
import '../search/search_controller.dart';

abstract class HomeController extends SearchMixController {
  fetchHomeData();
}

class HomeControllerImpl extends HomeController {
  String? username;
  AppServices appServices = Get.find();
  HomeProductsController productsController = Get.put(HomeProductsController());
  CategoriesController categoryController = Get.put(CategoriesController());
  UsersController usersController = Get.put(UsersController());
  OrdersController orderController = Get.put(OrdersController());
  DeliveryController deliveryController = Get.put(DeliveryController());
  CouponController couponsController = Get.put(CouponController());
  BrandsController brandsController = Get.put(BrandsController());
  NotificationController notificationsController =
      Get.put(NotificationController());
  List settings = [];
  List categories = [];
  List items = [];
  List brands = [];
  List coupon = [];
  List delivery = [];
  List deliveryDetail = [];
  List notification = [];
  List orders = [];
  StatusRequest statusRequest = StatusRequest.none;

  ///Home Page Data
  HomeRemoteDataSource homeRemoteDataSource = HomeRemoteDataSource(Get.find());

  initialData() async {
    username = appServices.sharedPreferences.getString("username");

    ///ORDERS
    orderController.initialDataOrders();

    ///DELIVERY
    deliveryController.initialDataDelivery();

    ///COUPON
    couponsController.initialDataCoupon();

    ///BRANDS
    brandsController.initialDataBrands();

    ///Products filter
    productsController.initialDataProducts();

    ///Categories filter
    categoryController.initialDataCategories();

    ///Users filter
    usersController.initialDataUsers();

    ///Notification
    notificationsController.initialDataNotification();

    print("this last month ${productsController.lastMonthProducts}");
    print("this last 2 week ${productsController.lastTwoWeekProducts}");
    print("this last week ${productsController.lastWeekProducts}");
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    searchCategoriesController = TextEditingController();
    searchBrandController = TextEditingController();
    searchCouponController = TextEditingController();
    searchDeliveriesController = TextEditingController();
    searchNotificationController = TextEditingController();
    searchOrdersController = TextEditingController();
    initialData();
    fetchHomeData();
    productsController.fetchProducts();
    productsController.filterOfHighPriceOfProducts();
    productsController.filterOfLowPriceOfProducts();
    usersController.testFilteredProductsOfMonth();
    usersController.fetchUsers();
    categoryController.fetchCategories();
    print("-------Delivery lists-------");
    deliveryController.filterOfLastMonthOfDelivery();
    print("-------Delivery last month-------");
    print(deliveryController.filterOfLastMonthOfDelivery());
    print("-------Delivery last week-------");
    deliveryController.filterOfLastWeekOfDelivery();
    print("-------Delivery last two week-------");
    deliveryController.filterOfLastTwoWeekOfDelivery();
    orderController.filterOfAllLastTwoWeekOrders();
    orderController.filterOfAllLastMonthOrders();
    orderController.filterOfAllLastWeekOrders();
    orderController.fetchOrdersOfHome();
    print(deliveryController.filterOfLastTwoWeekOfDelivery());
    super.onInit();
  }

  @override
  fetchHomeData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeRemoteDataSource.fetchData();
    statusRequest = handlingData(response);
    print("----------Fetch Home Data $response");
    print(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        settings.addAll(response['settings']["data"]);
        categories.addAll(response['categories']["data"]);
        items.addAll(response['products']["data"]);
        brands.addAll(response['brands']["data"]);
        coupon.addAll(response['coupon']["data"]);
        delivery.addAll(response['delivery']["data"]);
        notification.addAll(response['notification']["data"]);
        orders.addAll(response['orders']["data"]);
        print("this is notification $notification");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onChangedItem(String value) {
    productsController.selectedItem = value;
    update();
  }

  onChangedProducts(String productValue) {
    productsController.selectedProducts = productValue;
    update();
  }

  onChangedDelivery(String deliveryValue) {
    deliveryController.selectedDelivery = deliveryValue;
    update();
  }

  onChangedOrders(String ordersValue) {
    orderController.selectedItem = ordersValue;
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
}

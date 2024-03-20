import 'package:admin/presentation/pages/home/home_screen.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:admin/core/functions/firebase_cloud_messaging_config.dart';

import '../../presentation/pages/categories/categories_screen.dart';
import '../../presentation/pages/notification/notification_screen.dart';
import '../../presentation/pages/orders/orders_screen.dart';
import '../../presentation/pages/product/product_screen.dart';
import '../../presentation/pages/profile/profile_screen.dart';


abstract class MainController extends GetxController {
  changePage(int currentpage);
}

class MainControllerImp extends MainController {
  int currentPage = 0;
  PageController? pageController;

  List<Widget> listPage = [
  HomeScreen(),
  ProductScreen(),
  CategoriesScreen(),
  OrdersScreen(),
  NotificationScreen(),
  ProfileScreen()
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItem = const[
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.home_2_bold),
        icon: Icon(EneftyIcons.home_2_outline),
        label: "Home"
    ),
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.a_3d_cube_bold),
        icon: Icon(EneftyIcons.a_3d_cube_outline),
        label: "Product"
    ),
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.category_2_bold),
        icon: Icon(EneftyIcons.category_2_outline),
        label: "Categories"
    ),
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.card_bold),
        icon: Icon(EneftyIcons.card_outline),
        label: "Orders"
    ),
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.notification_bing_bold),
        icon: Icon(EneftyIcons.notification_bing_outline),
        label: "Notification"
    ),
    BottomNavigationBarItem(
        activeIcon: Icon(EneftyIcons.profile_circle_bold),
        icon: Icon(EneftyIcons.profile_circle_outline),
        label: "Profile"
    ),
  ];

  List  titleBottomAppBar = [
    "home" ,
    "settings" ,
    "profile" ,
    "favorite",
  ];
  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    firebaseCloudMessagingConfig();
    super.onInit();
  }

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
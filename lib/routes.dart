import 'package:admin/core/constants/routes.dart';
import 'package:admin/core/middle_ware/middle_ware.dart';
import 'package:admin/presentation/pages/auth/authentication.dart';
import 'package:admin/presentation/pages/auth/forget_password/forget_password.dart';
import 'package:admin/presentation/pages/auth/reset_password/reset_password.dart';
import 'package:admin/presentation/pages/auth/success_pages/success_reset_password.dart';
import 'package:admin/presentation/pages/auth/success_pages/success_sigup.dart';
import 'package:admin/presentation/pages/auth/verify_code/verify_code.dart';
import 'package:admin/presentation/pages/auth/verify_code/verify_code_signup.dart';
import 'package:admin/presentation/pages/categories/add_categories.dart';
import 'package:admin/presentation/pages/categories/categories_screen.dart';
import 'package:admin/presentation/pages/categories/edit_category.dart';
import 'package:admin/presentation/pages/languages/languages.dart';
import 'package:admin/presentation/pages/main/main_screen.dart';
import 'package:admin/presentation/pages/notification/edit_notification_screen.dart';
import 'package:admin/presentation/pages/notification/notification_screen.dart';
import 'package:admin/presentation/pages/notification/send_notification_all_screen.dart';
import 'package:admin/presentation/pages/notification/send_notification_screen.dart';
import 'package:admin/presentation/pages/orders/detail_order/detail_order_screen.dart';
import 'package:admin/presentation/pages/product/add_product.dart';
import 'package:admin/presentation/pages/product/edit_product.dart';
import 'package:admin/presentation/pages/product/product_screen.dart';
import 'package:admin/presentation/pages/profile/tiles/statistic_screen.dart';
import 'package:admin/presentation/pages/profile/tiles/users_screen.dart';
import 'package:admin/presentation/pages/splash/splash_screen.dart';
import 'package:admin/presentation/pages/users/historic_users/historic_users_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [AppMiddleWare()]),
  GetPage(name: AppRoutes.login, page: () => const authenticationPage()),
  GetPage(name: AppRoutes.onboarding, page: () => Onbording()),
  GetPage(
      name: AppRoutes.forgetPassword, page: () => const ForgetPasswordPage()),
  GetPage(name: AppRoutes.verifyCode, page: () => const VerifyCodePage()),
  GetPage(
      name: AppRoutes.verifyCodeSignUp,
      page: () => const VerifyCodeSignUpPage()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPasswordPage()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoutes.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoutes.main, page: () => const MainScreen()),
  GetPage(name: AppRoutes.editProduct, page: () => const EditProductScreen()),
  GetPage(name: AppRoutes.addProduct, page: () => const AddProductScreen()),
  GetPage(name: AppRoutes.addCategory, page: () => const AddCategoriesScreen()),
  GetPage(
      name: AppRoutes.editCategory, page: () => const EditCategoriesScreen()),
  GetPage(name: AppRoutes.categories, page: () => const CategoriesScreen()),
  GetPage(name: AppRoutes.product, page: () => const ProductScreen()),
  GetPage(name: AppRoutes.orderDetail, page: () => const OrderDetailScreen()),
  GetPage(
      name: AppRoutes.historicUsers, page: () => const HistoricUsersScreen()),
  GetPage(name: AppRoutes.notification, page: () => const NotificationScreen()),
  GetPage(
      name: AppRoutes.editNotification,
      page: () => const EditNotificationScreen()),
  GetPage(
      name: AppRoutes.sendNotificationForAllUser,
      page: () => const SendNotificationOfAllUsersScreen()),
  GetPage(
      name: AppRoutes.addNotification,
      page: () => const SendNotificationScreen()),
  GetPage(name: AppRoutes.users, page: () => const UsersScreen()),
  GetPage(name: AppRoutes.statistic, page: () => const StatisticScreen()),
];

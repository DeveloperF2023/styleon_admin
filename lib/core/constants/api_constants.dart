class ApiConstants {
  static const String BASE_URL = "https://soukaina.online/admin";
  static const String AUTH_URL = "$BASE_URL/auth/";
  static const String IMAGE_URL = "https://soukaina.online/upload";
  static const String IMAGE_ITEMS = "$IMAGE_URL/items";
  static const String IMAGE_CATEGORIES = "$IMAGE_URL/categories";
  static const String IMAGE_BANNERS = "$IMAGE_URL/banners";
  static const String IMAGE_BRANDS = "$IMAGE_URL/brands";

  ///Authentication
  static const String SIGNUP_URL = "$AUTH_URL/signup.php";
  static const String LOGIN_URL = "$AUTH_URL/login.php";
  static const String VERIFYCODE_URL = "$AUTH_URL/verify_code.php";
  static const String RESEND_URL = "$AUTH_URL/resend.php";

  ///FORGET PASSWORD
  static const String CHECK_EMAIL = "$BASE_URL/forget/check_email.php";
  static const String RESET_PASSWORD = "$BASE_URL/forget/reset_password.php";
  static const String VERIFYCODE_FORGETPASSWORD =
      "$BASE_URL/forget/verify_code_forget.php";

  ///HOME
  static const String HOME_URL = "$BASE_URL/home.php";
  static const String CATEGORIE_URL = "$BASE_URL/categories/view.php";

  ///PRODUCTS
  static const String PRODUCT_URL = "$BASE_URL/products/view.php";

  ///COUNT
  static const String COUNT_PRODUCTS = "$BASE_URL/count/product_count.php";
  static const String COUNT_CATEGORIES = "$BASE_URL/count/category_count.php";
  static const String COUNT_BRANDS = "$BASE_URL/count/category_count.php";
  static const String COUNT_COUPON = "$BASE_URL/count/coupon_count.php";
  static const String COUNT_USERS = "$BASE_URL/count/users_count.php";
  static const String COUNT_DELIVERY = "$BASE_URL/count/delivery_count.php";
  static const String COUNT_NOTIFICATION =
      "$BASE_URL/count/notification_count.php";
  static const String COUNT_ORDERS = "$BASE_URL/count/orders_count.php";
  static const String COUNT_PENDING_ORDERS =
      "$BASE_URL/count/pending_count.php";
  static const String COUNT_ACCEPTED_ORDERS =
      "$BASE_URL/count/accepted_order_count.php";
  static const String COUNT_ARCHIVE_ORDERS =
      "$BASE_URL/count/archive_order_count.php";

  ///COUPON
  static const String CHECK_COUPON_URL = "$BASE_URL/coupon/check_coupon.php";

  ///ORDER
  static const String FETCH_ORDER_URL = "$BASE_URL/orders/checkout.php";
  static const String COUNT_ORDERS_URL = "$BASE_URL/orders/view_all_orders.php";
  static const String CHECKOUT_ORDER_URL = "$BASE_URL/orders/checkout.php";
  static const String PENDING_ORDER_URL = "$BASE_URL/orders/pending_order.php";
  static const String ARCHIVE_ORDER_URL = "$BASE_URL/orders/archive.php";
  static const String DETAIL_ORDER_URL = "$BASE_URL/orders/details.php";
  static const String REMOVE_ORDER_URL = "$BASE_URL/orders/delete.php";
  static const String RATING_ARCHIVE_ORDER_URL = "$BASE_URL/orders/rating.php";

  ///FILTER PRODUCTS
  static const String LAST_MONTH_PRODUCTS_FILTER =
      "$BASE_URL/filter/products/last_month_products.php";
  static const String LAST_WEEK_PRODUCTS_FILTER =
      "$BASE_URL/filter/products/last_week_products.php";
  static const String ALL_LAST_MONTH_PRODUCTS_FILTER =
      "$BASE_URL/filter/products/all_last_month_products.php";
  static const String ALL_LAST_WEEK_PRODUCTS_FILTER =
      "$BASE_URL/filter/products/all_last_week_products.php";
  static const String LAST_TWO_WEEK_PRODUCTS_FILTER =
      "$BASE_URL/filter/products/last_two_week_products.php";
  static const String LOW_PRICE_PRODUCTS_FILTER =
      "$BASE_URL/filter/products/low_price_products.php";
  static const String HIGH_PRICE_PRODUCTS_FILTER =
      "$BASE_URL/filter/products/high_price_products.php";

  ///FILTER CATEGORIES
  static const String LAST_MONTH_CATEGORIES_FILTER =
      "$BASE_URL/filter/categories/last_month_categories.php";
  static const String LAST_WEEK_CATEGORIES_FILTER =
      "$BASE_URL/filter/categories/last_week_categories.php";
  static const String LAST_TWO_WEEK_CATEGORIES_FILTER =
      "$BASE_URL/filter/categories/last_two_week_categories.php";
  static const String ALL_LAST_MONTH_CATEGORIES_FILTER =
      "$BASE_URL/filter/categories/all_last_month_categories.php";
  static const String ALL_LAST_WEEK_CATEGORIES_FILTER =
      "$BASE_URL/filter/categories/all_last_week_categories.php";

  ///FILTER USERS
  static const String LAST_MONTH_USERS_FILTER =
      "$BASE_URL/filter/users/last_month_users.php";
  static const String LAST_WEEK_USERS_FILTER =
      "$BASE_URL/filter/categories/last_week_users.php";
  static const String ALL_LAST_MONTH_USERS_FILTER =
      "$BASE_URL/filter/users/all_last_month_users.php";
  static const String ALL_LAST_WEEK_USERS_FILTER =
      "$BASE_URL/filter/categories/all_last_week_users.php";
  static const String LAST_TWO_WEEK_USERS_FILTER =
      "$BASE_URL/filter/categories/last_two_week_users.php";

  ///FILTER DELIVERY
  static const String LAST_MONTH_DELIVERY_FILTER =
      "$BASE_URL/filter/delivery/last_month_delivery.php";
  static const String LAST_WEEK_DELIVERY_FILTER =
      "$BASE_URL/filter/delivery/last_week_delivery.php";
  static const String LAST_TWO_WEEK_DELIVERY_FILTER =
      "$BASE_URL/filter/delivery/last_two_week_delivery.php";

  ///FILTER ORDERS
  static const String LAST_MONTH_ORDERS_FILTER =
      "$BASE_URL/filter/orders/last_month_orders.php";
  static const String LAST_TWO_WEEK_ORDERS_FILTER =
      "$BASE_URL/filter/orders/last_two_week_orders.php";
  static const String LAST_WEEK_ORDERS_FILTER =
      "$BASE_URL/filter/orders/all_last_week_orders.php";
  static const String ALL_LAST_MONTH_ORDERS_FILTER =
      "$BASE_URL/filter/orders/all_last_month_orders.php";
  static const String ALL_LAST_TWO_WEEK_ORDERS_FILTER =
      "$BASE_URL/filter/orders/all_last_two_week_orders.php";
  static const String ALL_LAST_WEEK_ORDERS_FILTER =
      "$BASE_URL/filter/orders/last_week_orders.php";
  static const String PENDIND_FILTER =
      "$BASE_URL/filter/orders/pending_orders.php";
  static const String ACCEPTED_FILTER =
      "$BASE_URL/filter/orders/accepted_orders.php";
  static const String ARCHIVE_FILTER =
      "$BASE_URL/filter/orders/archive_orders.php";

  ///FILTER NOTIFICATION
  static const String LAST_MONTH_NOTIFICATION_FILTER =
      "$BASE_URL/filter/notification/last_month_notification.php";
  static const String LAST_WEEK_NOTIFICATION_FILTER =
      "$BASE_URL/filter/notification/last_week_notification.php";

  ///SEARCH
  static const String SEARCH_PRODUCT_URL =
      "https://soukaina.online/search/search.php";
  static const String SEARCH_CATEGORY_URL =
      "https://soukaina.online/search/category_search.php";
  static const String SEARCH_BRANDS_URL =
      "https://soukaina.online/search/brand_search.php";
  static const String SEARCH_COUPON_URL =
      "https://soukaina.online/search/coupon_search.php";
  static const String SEARCH_DELIVERY_URL =
      "https://soukaina.online/search/delivery_search.php";
  static const String SEARCH_NOTIFICATION_URL =
      "https://soukaina.online/search/notification_search.php";
  static const String SEARCH_ORDERS_URL =
      "https://soukaina.online/search/order_search.php";
  static const String SEARCH_USERS_URL =
      "https://soukaina.online/search/users_search.php";

  ///Manage Products
  static const String ADD_PRODUCT_URL = "$BASE_URL/products/add.php";
  static const String EDIT_PRODUCT_URL = "$BASE_URL/products/edit.php";
  static const String REMOVE_PRODUCT_URL = "$BASE_URL/products/delete.php";
  static const String VIEW_PRODUCT_URL = "$BASE_URL/products/view.php";

  ///MANAGE NOTIFICATION
  static const String VIEW_NOTIFICATION_URL =
      "$BASE_URL/notification/manage/view.php";
  static const String EDIT_NOTIFICATION_URL =
      "$BASE_URL/notification/manage/edit.php";
  static const String DELETE_NOTIFICATION_URL =
      "$BASE_URL/notification/manage/delete.php";
  static const String SEND_NOTIFICATION_URL =
      "$BASE_URL/notification/manage/add.php";
  static const String SEND_SPECEFIC_USER_NOTIFICATION_URL =
      "$BASE_URL/notification/manage/send_user.php";

  ///Manage Categories
  static const String ADD_CATEGORIES_URL = "$BASE_URL/categories/add.php";
  static const String EDIT_CATEGORIES_URL = "$BASE_URL/categories/edit.php";
  static const String REMOVE_CATEGORIES_URL = "$BASE_URL/categories/delete.php";
  static const String VIEW_CATEGORIES_URL = "$BASE_URL/categories/view.php";

  ///Manage Orders
  static const String REMOVE_ORDERS_URL = "$BASE_URL/orders/manage/delete.php";
  static const String VIEW_ORDERS_URL = "$BASE_URL/orders/view.php";
  static const String APPROVE_ORDERS_URL = "$BASE_URL/orders/approve.php";
  static const String DONE_PREPARED_ORDERS_URL = "$BASE_URL/orders/prepare.php";
  static const String DETAIL_ORDERS_URL = "$BASE_URL/orders/detail_order.php";
  static const String FETCH_RATING_URL =
      "https://soukaina.online/orders/fetch_rating.php";

  ///Manage Users
  static const String HISTORIC_USERS_URL = "$BASE_URL/users/historic_users.php";
  static const String VIEW_USERS_URL = "$BASE_URL/users/view.php";
}

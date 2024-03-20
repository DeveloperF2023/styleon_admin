class DeliveryDetailModel {
  int? deliveryId;
  String? deliveryUsername;
  String? deliveryEmail;
  String? deliveryPassword;
  String? deliveryPhone;
  int? deliveryVerifyCode;
  int? deliveryApprove;
  String? deliveryCreatedAt;
  String? countPrice;
  int? countProducts;
  int? cartId;
  int? cartUserid;
  int? cartProductId;
  int? cartOrders;
  int? productId;
  String? productName;
  String? productNameFr;
  String? productDesc;
  String? productDescFr;
  String? productImage;
  int? productStock;
  int? productStatus;
  int? productPrice;
  int? productDiscount;
  String? createdAtProduct;
  int? productCategory;
  double? productRating;
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersType;
  int? ordersPriceDelivery;
  int? ordersPrice;
  int? ordersTotalPrice;
  int? ordersCoupon;
  int? ordersRating;
  String? ordersNoteRating;
  int? userId;
  String? usernameOfUser;
  String? ordersDate;
  int? ordersPaymentMethod;
  int? ordersStatus;
  int? ordersDelivery;
  int? addressId;
  int? addressUserid;
  String? addressCity;
  String? addressStreet;
  double? addressLat;
  double? addressLong;
  String? addressName;

  DeliveryDetailModel(
      {this.deliveryId,
        this.deliveryUsername,
        this.deliveryEmail,
        this.deliveryPassword,
        this.deliveryPhone,
        this.deliveryVerifyCode,
        this.deliveryApprove,
        this.deliveryCreatedAt,
        this.countPrice,
        this.countProducts,
        this.cartId,
        this.cartUserid,
        this.cartProductId,
        this.cartOrders,
        this.productId,
        this.productName,
        this.productNameFr,
        this.productDesc,
        this.productDescFr,
        this.productImage,
        this.productStock,
        this.productStatus,
        this.productPrice,
        this.productDiscount,
        this.createdAtProduct,
        this.productCategory,
        this.productRating,
        this.ordersId,
        this.ordersUserid,
        this.ordersAddress,
        this.ordersType,
        this.ordersPriceDelivery,
        this.ordersPrice,
        this.ordersTotalPrice,
        this.ordersCoupon,
        this.ordersRating,
        this.ordersNoteRating,
        this.userId,
        this.usernameOfUser,
        this.ordersDate,
        this.ordersPaymentMethod,
        this.ordersStatus,
        this.ordersDelivery,
        this.addressId,
        this.addressUserid,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong,
        this.addressName});

  DeliveryDetailModel.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    deliveryUsername = json['delivery_username'];
    deliveryEmail = json['delivery_email'];
    deliveryPassword = json['delivery_password'];
    deliveryPhone = json['delivery_phone'];
    deliveryVerifyCode = json['delivery_verify_code'];
    deliveryApprove = json['delivery_approve'];
    deliveryCreatedAt = json['delivery_created_at'];
    countPrice = json['countPrice'];
    countProducts = json['countProducts'];
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartProductId = json['cart_productid'];
    cartOrders = json['cart_orders'];
    productId = json['product_id'];
    productName = json['product_name'];
    productNameFr = json['product_name_fr'];
    productDesc = json['product_desc'];
    productDescFr = json['product_desc_fr'];
    productImage = json['product_image'];
    productStock = json['product_stock'];
    productStatus = json['product_status'];
    productPrice = json['product_price'];
    productDiscount = json['product_discount'];
    createdAtProduct = json['created_at_product'];
    productCategory = json['product_category'];
    productRating = json['product_rating'];
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_priceDelivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_totalPrice'];
    ordersCoupon = json['orders_coupon'];
    ordersRating = json['orders_rating'];
    ordersNoteRating = json['orders_noterating'];
    userId = json['user_id'];
    usernameOfUser = json['name_user'];
    ordersDate = json['orders_date'];
    ordersPaymentMethod = json['orders_paymentmethod'];
    ordersStatus = json['orders_status'];
    ordersDelivery = json['orders_delivery'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delivery_id'] = deliveryId;
    data['delivery_username'] = deliveryUsername;
    data['delivery_email'] = deliveryEmail;
    data['delivery_password'] = deliveryPassword;
    data['delivery_phone'] = deliveryPhone;
    data['delivery_verify_code'] = deliveryVerifyCode;
    data['delivery_approve'] = deliveryApprove;
    data['delivery_created_at'] = deliveryCreatedAt;
    data['countPrice'] = countPrice;
    data['countProducts'] = countProducts;
    data['cart_id'] = cartId;
    data['cart_userid'] = cartUserid;
    data['cart_productid'] = cartProductId;
    data['cart_orders'] = cartOrders;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_name_fr'] = productNameFr;
    data['product_desc'] = productDesc;
    data['product_desc_fr'] = productDescFr;
    data['product_image'] = productImage;
    data['product_stock'] = productStock;
    data['product_status'] = productStatus;
    data['product_price'] = productPrice;
    data['product_discount'] = productDiscount;
    data['created_at_product'] = createdAtProduct;
    data['product_category'] = productCategory;
    data['product_rating'] = productRating;
    data['orders_id'] = ordersId;
    data['orders_userid'] = ordersUserid;
    data['orders_address'] = ordersAddress;
    data['orders_type'] = ordersType;
    data['orders_priceDelivery'] = ordersPriceDelivery;
    data['orders_price'] = ordersPrice;
    data['orders_totalPrice'] = ordersTotalPrice;
    data['orders_coupon'] = ordersCoupon;
    data['orders_rating'] = ordersRating;
    data['orders_noterating'] = ordersNoteRating;
    data['user_id'] =userId;
    data['name_user'] = usernameOfUser;
    data['orders_date'] = ordersDate;
    data['orders_paymentmethod'] = ordersPaymentMethod;
    data['orders_status'] = ordersStatus;
    data['orders_delivery'] = ordersDelivery;
    data['address_id'] = addressId;
    data['address_userid'] = addressUserid;
    data['address_city'] = addressCity;
    data['address_street'] = addressStreet;
    data['address_lat'] = addressLat;
    data['address_long'] = addressLong;
    data['address_name'] = addressName;
    return data;
  }
}
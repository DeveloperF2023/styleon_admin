class DeliveryModel {
  int? deliveryId;
  String? deliveryUsername;
  String? deliveryEmail;
  String? deliveryPassword;
  String? deliveryPhone;
  int? deliveryVerifyCode;
  int? deliveryApprove;
  String? deliveryCreatedAt;

  DeliveryModel(
      {this.deliveryId,
        this.deliveryUsername,
        this.deliveryEmail,
        this.deliveryPassword,
        this.deliveryPhone,
        this.deliveryVerifyCode,
        this.deliveryApprove,
        this.deliveryCreatedAt});

  DeliveryModel.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    deliveryUsername = json['delivery_username'];
    deliveryEmail = json['delivery_email'];
    deliveryPassword = json['delivery_password'];
    deliveryPhone = json['delivery_phone'];
    deliveryVerifyCode = json['delivery_verify_code'];
    deliveryApprove = json['delivery_approve'];
    deliveryCreatedAt = json['delivery_created_at'];
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
    return data;
  }
}
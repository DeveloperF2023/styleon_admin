class UsersModel {
  int? userId;
  String? username;
  String? email;
  String? password;
  String? phone;
  int? verifyCode;
  int? approve;
  DateTime? createdAt;

  UsersModel(
      {this.userId,
      this.username,
      this.email,
      this.password,
      this.phone,
      this.verifyCode,
      this.approve,
      this.createdAt});

  UsersModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    verifyCode = json['verify_code'];
    approve = json['approve'];
    createdAt = DateTime.parse(json['created_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    data['verify_code'] = verifyCode;
    data['approve'] = approve;
    data['created_at'] = createdAt;
    return data;
  }
}

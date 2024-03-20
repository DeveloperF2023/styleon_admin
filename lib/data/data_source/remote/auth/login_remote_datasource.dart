import 'package:admin/core/class/crud.dart';
import 'package:admin/core/constants/api_constants.dart';

class LoginRemoteDataSource{
  CRUD crud;
  LoginRemoteDataSource(this.crud);
  postData(String email,String password) async {
    var response = await crud.postData(ApiConstants.LOGIN_URL, {
      "email":email,
      "password":password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
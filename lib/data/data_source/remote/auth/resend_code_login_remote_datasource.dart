import 'package:admin/core/class/crud.dart';
import 'package:admin/core/constants/api_constants.dart';

class ResendVerifyCodeRemoteDataSource{
  CRUD crud;
  ResendVerifyCodeRemoteDataSource(this.crud);
  resendCode(String email)async{
    var response = await crud.postData(ApiConstants.RESEND_URL, {
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
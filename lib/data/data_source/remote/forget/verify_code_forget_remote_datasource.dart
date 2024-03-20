import 'package:admin/core/class/crud.dart';
import 'package:admin/core/constants/api_constants.dart';

class VerifyCodeForgetPasswordRemoteDataSource{
  CRUD crud;
  VerifyCodeForgetPasswordRemoteDataSource(this.crud);
  postData(String email,String verifyCode)async{
    var response = await crud.postData(ApiConstants.VERIFYCODE_FORGETPASSWORD, {
      "email":email,
      "verify_code":verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
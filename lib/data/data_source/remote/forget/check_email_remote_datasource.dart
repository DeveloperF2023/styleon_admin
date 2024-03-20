import 'package:admin/core/class/crud.dart';
import 'package:admin/core/constants/api_constants.dart';

class CheckEmailRemoteDataSource{
  CRUD crud;
  CheckEmailRemoteDataSource(this.crud);
  postData(String email)async{
    var response = await crud.postData(ApiConstants.CHECK_EMAIL, {
      "email":email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
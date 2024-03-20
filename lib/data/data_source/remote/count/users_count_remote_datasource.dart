import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountUsersRemoteDataSource{
  CRUD crud;
  CountUsersRemoteDataSource(this.crud);
  countUsers()async{
    var response = await crud.postData(ApiConstants.COUNT_USERS, {});
    return response.fold((l) => l, (r) => r);
  }
}
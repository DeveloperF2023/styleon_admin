import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class ViewUsersRemoteDataSource {
  CRUD crud;
  ViewUsersRemoteDataSource(this.crud);
  viewUsers() async {
    var response = await crud.postData(ApiConstants.VIEW_USERS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}

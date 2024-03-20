import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class SearchUsersRemoteDataSource {
  CRUD crud;
  SearchUsersRemoteDataSource(this.crud);
  searchUser(String search) async {
    var response =
        await crud.postData(ApiConstants.SEARCH_USERS_URL, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}

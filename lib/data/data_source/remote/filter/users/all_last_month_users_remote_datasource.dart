import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAllLastMonthUsersRemoteDataSource {
  CRUD crud;
  FilterOfAllLastMonthUsersRemoteDataSource(this.crud);
  filterOfLastMonth() async {
    var response =
        await crud.postData(ApiConstants.ALL_LAST_MONTH_USERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}

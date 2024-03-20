import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAllLastWeekUsersRemoteDataSource {
  CRUD crud;
  FilterOfAllLastWeekUsersRemoteDataSource(this.crud);
  filterOfLastWeek() async {
    var response =
        await crud.postData(ApiConstants.ALL_LAST_WEEK_USERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}

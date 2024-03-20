import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastWeekUsersRemoteDataSource{
  CRUD crud;
  FilterOfLastWeekUsersRemoteDataSource(this.crud);
  filterOfLastWeek()async{
    var response = await crud.postData(ApiConstants.LAST_WEEK_USERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
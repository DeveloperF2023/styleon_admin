import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastTwoWeekUsersRemoteDataSource{
  CRUD crud;
  FilterOfLastTwoWeekUsersRemoteDataSource(this.crud);
  filterOfLastTwoWeek()async{
    var response = await crud.postData(ApiConstants.LAST_TWO_WEEK_USERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
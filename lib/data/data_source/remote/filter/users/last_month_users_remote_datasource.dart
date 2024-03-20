import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastMonthUsersRemoteDataSource{
  CRUD crud;
  FilterOfLastMonthUsersRemoteDataSource(this.crud);
  filterOfLastMonth()async{
    var response = await crud.postData(ApiConstants.LAST_MONTH_USERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
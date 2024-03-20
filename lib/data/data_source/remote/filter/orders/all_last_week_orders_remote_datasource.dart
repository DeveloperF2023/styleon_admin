import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAllLastWeekOrdersRemoteDataSource{
  CRUD crud;
  FilterOfAllLastWeekOrdersRemoteDataSource(this.crud);
  filterOfLastWeek()async{
    var response = await crud.postData(ApiConstants.ALL_LAST_WEEK_ORDERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
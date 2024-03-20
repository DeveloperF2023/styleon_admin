import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAllLastTwoWeekOrdersRemoteDataSource{
  CRUD crud;
  FilterOfAllLastTwoWeekOrdersRemoteDataSource(this.crud);
  filterOfLastTwoWeek()async{
    var response = await crud.postData(ApiConstants.ALL_LAST_TWO_WEEK_ORDERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
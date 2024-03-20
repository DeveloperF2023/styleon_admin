import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastWeekOrdersRemoteDataSource{
  CRUD crud;
  FilterOfLastWeekOrdersRemoteDataSource(this.crud);
  filterOfLastWeek()async{
    var response = await crud.postData(ApiConstants.LAST_WEEK_ORDERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
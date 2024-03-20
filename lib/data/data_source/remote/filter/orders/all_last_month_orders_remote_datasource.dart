import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAllLastMonthOrdersRemoteDataSource{
  CRUD crud;
  FilterOfAllLastMonthOrdersRemoteDataSource(this.crud);
  filterOfLastMonth()async{
    var response = await crud.postData(ApiConstants.ALL_LAST_MONTH_ORDERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
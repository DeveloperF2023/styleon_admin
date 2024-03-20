import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastMonthOrdersRemoteDataSource{
  CRUD crud;
  FilterOfLastMonthOrdersRemoteDataSource(this.crud);
  filterOfLastMonth()async{
    var response = await crud.postData(ApiConstants.LAST_MONTH_ORDERS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
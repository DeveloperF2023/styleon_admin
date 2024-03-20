import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastMonthDeliveryRemoteDataSource{
  CRUD crud;
  FilterOfLastMonthDeliveryRemoteDataSource(this.crud);
  filterOfLastMonth()async{
    var response = await crud.postData(ApiConstants.LAST_MONTH_DELIVERY_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
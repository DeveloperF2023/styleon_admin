import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastWeekDeliveryRemoteDataSource{
  CRUD crud;
  FilterOfLastWeekDeliveryRemoteDataSource(this.crud);
  filterOfLastWeek()async{
    var response = await crud.postData(ApiConstants.LAST_WEEK_DELIVERY_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
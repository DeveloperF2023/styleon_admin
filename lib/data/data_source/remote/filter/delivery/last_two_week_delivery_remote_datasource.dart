import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastTwoWeekDeliveryRemoteDataSource{
  CRUD crud;
  FilterOfLastTwoWeekDeliveryRemoteDataSource(this.crud);
  filterOfLastTwoWeek()async{
    var response = await crud.postData(ApiConstants.LAST_TWO_WEEK_DELIVERY_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
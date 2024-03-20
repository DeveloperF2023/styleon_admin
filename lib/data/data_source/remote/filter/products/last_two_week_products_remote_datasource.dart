import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastTwoWeekProductsRemoteDataSource{
  CRUD crud;
  FilterOfLastTwoWeekProductsRemoteDataSource(this.crud);
  filterOfLastTwoWeek()async{
    var response = await crud.postData(ApiConstants.LAST_TWO_WEEK_PRODUCTS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
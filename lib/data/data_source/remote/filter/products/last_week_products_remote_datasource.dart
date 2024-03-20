import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastWeekProductsRemoteDataSource{
  CRUD crud;
  FilterOfLastWeekProductsRemoteDataSource(this.crud);
  filterOfLastWeek()async{
    var response = await crud.postData(ApiConstants.LAST_WEEK_PRODUCTS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
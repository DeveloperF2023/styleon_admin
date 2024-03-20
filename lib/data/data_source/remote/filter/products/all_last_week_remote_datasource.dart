import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAllLastWeekProductsRemoteDataSource{
  CRUD crud;
  FilterOfAllLastWeekProductsRemoteDataSource(this.crud);
  filterOfLastWeek()async{
    var response = await crud.postData(ApiConstants.ALL_LAST_WEEK_PRODUCTS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
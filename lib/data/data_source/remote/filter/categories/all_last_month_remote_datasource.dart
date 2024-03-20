import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAllLastMonthCategoriesRemoteDataSource{
  CRUD crud;
  FilterOfAllLastMonthCategoriesRemoteDataSource(this.crud);
  filterOfLastMonth()async{
    var response = await crud.postData(ApiConstants.ALL_LAST_MONTH_CATEGORIES_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
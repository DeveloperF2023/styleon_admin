import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastMonthCategoriesRemoteDataSource{
  CRUD crud;
  FilterOfLastMonthCategoriesRemoteDataSource(this.crud);
  filterOfLastMonth()async{
    var response = await crud.postData(ApiConstants.LAST_MONTH_CATEGORIES_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAllLastWeekCategoriesRemoteDataSource{
  CRUD crud;
  FilterOfAllLastWeekCategoriesRemoteDataSource(this.crud);
  filterOfLastWeek()async{
    var response = await crud.postData(ApiConstants.ALL_LAST_WEEK_CATEGORIES_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
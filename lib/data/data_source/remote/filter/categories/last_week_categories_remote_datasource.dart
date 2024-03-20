import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastWeekCategoriesRemoteDataSource{
  CRUD crud;
  FilterOfLastWeekCategoriesRemoteDataSource(this.crud);
  filterOfLastWeek()async{
    var response = await crud.postData(ApiConstants.LAST_WEEK_CATEGORIES_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
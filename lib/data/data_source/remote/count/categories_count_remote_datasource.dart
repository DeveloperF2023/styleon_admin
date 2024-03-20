import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountCategoriesRemoteDataSource{
  CRUD crud;
  CountCategoriesRemoteDataSource(this.crud);
  countCategories()async{
    var response = await crud.postData(ApiConstants.COUNT_CATEGORIES, {});
    return response.fold((l) => l, (r) => r);
  }
}
import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class ViewCategoriesRemoteDataSource {
  CRUD crud;
  ViewCategoriesRemoteDataSource(this.crud);
  fetchCategories() async {
    var response = await crud.postData(ApiConstants.VIEW_CATEGORIES_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}

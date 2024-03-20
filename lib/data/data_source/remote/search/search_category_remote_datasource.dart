import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';


class SearchCategoriesRemoteDataSource{
  CRUD crud;
  SearchCategoriesRemoteDataSource(this.crud);
  searchCategory(String search)async{
    var response = await crud.postData(ApiConstants.SEARCH_CATEGORY_URL, {"search":search});
    return response.fold((l) => l, (r) => r);
  }
}

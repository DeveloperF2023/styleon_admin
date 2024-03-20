import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';


class SearchBrandsRemoteDataSource{
  CRUD crud;
  SearchBrandsRemoteDataSource(this.crud);
  searchBrand(String search)async{
    var response = await crud.postData(ApiConstants.SEARCH_BRANDS_URL, {"search":search});
    return response.fold((l) => l, (r) => r);
  }
}
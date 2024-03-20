import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FetchProductsRemoteDataSource{
  CRUD crud;
  FetchProductsRemoteDataSource(this.crud);
  fetchData()async{
    var response = await crud.postData(ApiConstants.PRODUCT_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
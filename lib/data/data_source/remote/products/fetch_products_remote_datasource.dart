import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class ViewProductsRemoteDataSource {
  CRUD crud;
  ViewProductsRemoteDataSource(this.crud);
  fetchProducts() async {
    var response = await crud.postData(ApiConstants.VIEW_PRODUCT_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}

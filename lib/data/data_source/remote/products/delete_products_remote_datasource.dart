import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class DeleteProductsRemoteDataSource {
  CRUD crud;
  DeleteProductsRemoteDataSource(this.crud);
  deleteProducts(
      String productId,
      String imageName,
      ) async {
    var response = await crud.postData(ApiConstants.REMOVE_PRODUCT_URL, {
      "productId":productId,
      "imageName":imageName
    });
    return response.fold((l) => l, (r) => r);
  }
}

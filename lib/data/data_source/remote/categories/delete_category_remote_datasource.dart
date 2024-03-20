import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class DeleteCategoryRemoteDataSource {
  CRUD crud;
  DeleteCategoryRemoteDataSource(this.crud);
  deleteCategory(
      String categoryId,
      String imageName,
      ) async {
    var response = await crud.postData(ApiConstants.REMOVE_CATEGORIES_URL, {
      "categoryId":categoryId,
      "imageName":imageName
    });
    return response.fold((l) => l, (r) => r);
  }
}

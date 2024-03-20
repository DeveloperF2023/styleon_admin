import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountProductRemoteDataSource{
  CRUD crud;
  CountProductRemoteDataSource(this.crud);
  countProducts()async{
    var response = await crud.postData(ApiConstants.COUNT_PRODUCTS, {});
    return response.fold((l) => l, (r) => r);
  }
}
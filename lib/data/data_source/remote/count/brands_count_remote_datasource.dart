import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountBrandsRemoteDataSource{
  CRUD crud;
  CountBrandsRemoteDataSource(this.crud);
  countBrands()async{
    var response = await crud.postData(ApiConstants.COUNT_BRANDS, {});
    return response.fold((l) => l, (r) => r);
  }
}
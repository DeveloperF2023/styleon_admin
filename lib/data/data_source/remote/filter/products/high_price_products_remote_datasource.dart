import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfHighPriceProductsRemoteDataSource{
  CRUD crud;
  FilterOfHighPriceProductsRemoteDataSource(this.crud);
  filterOfHighPrice()async{
    var response = await crud.postData(ApiConstants.HIGH_PRICE_PRODUCTS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
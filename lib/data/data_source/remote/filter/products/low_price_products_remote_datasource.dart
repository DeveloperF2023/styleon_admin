import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLowPriceProductsRemoteDataSource{
  CRUD crud;
  FilterOfLowPriceProductsRemoteDataSource(this.crud);
  filterOfLowPrice()async{
    var response = await crud.postData(ApiConstants.LOW_PRICE_PRODUCTS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
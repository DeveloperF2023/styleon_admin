import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAllLastMonthProductsRemoteDataSource{
  CRUD crud;
  FilterOfAllLastMonthProductsRemoteDataSource(this.crud);
  filterOfLastMonth()async{
    var response = await crud.postData(ApiConstants.ALL_LAST_MONTH_PRODUCTS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
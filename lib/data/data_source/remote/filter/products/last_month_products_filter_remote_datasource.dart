import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastMonthProductsRemoteDataSource{
  CRUD crud;
  FilterOfLastMonthProductsRemoteDataSource(this.crud);
  filterOfLastMonth()async{
    var response = await crud.postData(ApiConstants.LAST_MONTH_PRODUCTS_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
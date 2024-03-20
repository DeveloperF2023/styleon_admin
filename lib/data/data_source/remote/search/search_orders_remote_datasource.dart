import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';


class SearchOrdersRemoteDataSource{
  CRUD crud;
  SearchOrdersRemoteDataSource(this.crud);
  searchOrders(String search)async{
    var response = await crud.postData(ApiConstants.SEARCH_ORDERS_URL, {"search":search});
    return response.fold((l) => l, (r) => r);
  }
}
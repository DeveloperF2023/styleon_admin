//COUNT_ORDERS_URL
import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class FetchCountOrdersRemoteDataSource {
  CRUD crud;
  FetchCountOrdersRemoteDataSource(this.crud);
  fetchOrders() async {
    var response = await crud.postData(ApiConstants.COUNT_ORDERS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}

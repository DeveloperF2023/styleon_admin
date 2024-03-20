import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class ViewOrdersRemoteDataSource {
  CRUD crud;
  ViewOrdersRemoteDataSource(this.crud);
  fetchOrders() async {
    var response = await crud.postData(ApiConstants.VIEW_ORDERS_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}

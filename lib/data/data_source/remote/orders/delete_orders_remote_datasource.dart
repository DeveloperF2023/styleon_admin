import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class DeleteOrdersRemoteDataSource {
  CRUD crud;
  DeleteOrdersRemoteDataSource(this.crud);
  deleteOrders(
      String orderId,
      ) async {
    var response = await crud.postData(ApiConstants.REMOVE_ORDER_URL, {
      "orderId":orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}

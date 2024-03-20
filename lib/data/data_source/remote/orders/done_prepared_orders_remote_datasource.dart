import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class DonePreparedOrdersRemoteDataSource {
  CRUD crud;
  DonePreparedOrdersRemoteDataSource(this.crud);
  donePreparedOrders(String userId,String orderId,String orderType) async {
    var response = await crud.postData(ApiConstants.DONE_PREPARED_ORDERS_URL, {
      "orderId":orderId,
      "userId":userId,
      "orderType":orderType
    });
    return response.fold((l) => l, (r) => r);
  }
}

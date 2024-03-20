import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class ApproveOrdersRemoteDataSource {
  CRUD crud;
  ApproveOrdersRemoteDataSource(this.crud);
  approveOrders(String userId,String orderId) async {
    var response = await crud.postData(ApiConstants.APPROVE_ORDERS_URL, {
      "orderId":orderId,
      "userId":userId,
    });
    return response.fold((l) => l, (r) => r);
  }
}


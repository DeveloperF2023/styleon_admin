import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class DetailOrdersRemoteDataSource {
  CRUD crud;
  DetailOrdersRemoteDataSource(this.crud);
  detailOrder(String orderId) async {
    var response = await crud.postData(ApiConstants.DETAIL_ORDER_URL, {
      "orderId":orderId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountPendingOrdersRemoteDataSource{
  CRUD crud;
  CountPendingOrdersRemoteDataSource(this.crud);
  countPendingOrders()async{
    var response = await crud.postData(ApiConstants.COUNT_PENDING_ORDERS, {});
    return response.fold((l) => l, (r) => r);
  }
}
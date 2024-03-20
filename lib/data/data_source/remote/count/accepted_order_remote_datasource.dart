import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountAcceptedOrdersRemoteDataSource{
  CRUD crud;
  CountAcceptedOrdersRemoteDataSource(this.crud);
  countAcceptedOrders()async{
    var response = await crud.postData(ApiConstants.COUNT_ACCEPTED_ORDERS, {});
    return response.fold((l) => l, (r) => r);
  }
}
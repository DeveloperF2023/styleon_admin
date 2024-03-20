import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FetchOrdersRemoteDataSource{
  CRUD crud;
  FetchOrdersRemoteDataSource(this.crud);
    fetchOrders()async{
    var response = await crud.postData(ApiConstants.FETCH_ORDER_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
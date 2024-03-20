import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountOrdersRemoteDataSource{
  CRUD crud;
  CountOrdersRemoteDataSource(this.crud);
  countOrders()async{
    var response = await crud.postData(ApiConstants.COUNT_ORDERS, {});
    return response.fold((l) => l, (r) => r);
  }
}
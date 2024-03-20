import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountArchiveOrdersRemoteDataSource{
  CRUD crud;
  CountArchiveOrdersRemoteDataSource(this.crud);
  countArchiveOrders()async{
    var response = await crud.postData(ApiConstants.COUNT_ARCHIVE_ORDERS, {});
    return response.fold((l) => l, (r) => r);
  }
}
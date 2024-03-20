import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfPendingOrdersRemoteDataSource{
  CRUD crud;
  FilterOfPendingOrdersRemoteDataSource(this.crud);
  filterOfPending()async{
    var response = await crud.postData(ApiConstants.PENDIND_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
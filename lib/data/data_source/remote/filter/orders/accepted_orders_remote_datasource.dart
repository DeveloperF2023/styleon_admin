import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfAcceptedOrdersRemoteDataSource{
  CRUD crud;
  FilterOfAcceptedOrdersRemoteDataSource(this.crud);
  filterOfAccepted()async{
    var response = await crud.postData(ApiConstants.ACCEPTED_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}
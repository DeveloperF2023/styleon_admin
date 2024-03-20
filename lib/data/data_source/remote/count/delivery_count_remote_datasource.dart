import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountDeliveryRemoteDataSource{
  CRUD crud;
  CountDeliveryRemoteDataSource(this.crud);
  countDelivery()async{
    var response = await crud.postData(ApiConstants.COUNT_DELIVERY, {});
    return response.fold((l) => l, (r) => r);
  }
}
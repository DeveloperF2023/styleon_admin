import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountNotificationRemoteDataSource{
  CRUD crud;
  CountNotificationRemoteDataSource(this.crud);
  countNotification()async{
    var response = await crud.postData(ApiConstants.COUNT_NOTIFICATION, {});
    return response.fold((l) => l, (r) => r);
  }
}
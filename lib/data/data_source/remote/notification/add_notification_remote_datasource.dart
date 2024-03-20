import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class AddNotificationRemoteDataSource {
  CRUD crud;
  AddNotificationRemoteDataSource(this.crud);
  addNotification(Map data) async {
    var response =
        await crud.postData(ApiConstants.SEND_NOTIFICATION_URL, data);
    return response.fold((l) => l, (r) => r);
  }
}

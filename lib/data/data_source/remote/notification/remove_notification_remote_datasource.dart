import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class DeleteNotificationRemoteDataSource {
  CRUD crud;
  DeleteNotificationRemoteDataSource(this.crud);
  deleteNotification(String notificationId) async {
    var response = await crud.postData(ApiConstants.DELETE_NOTIFICATION_URL,
        {"notificationId": notificationId});
    return response.fold((l) => l, (r) => r);
  }
}

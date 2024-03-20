import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class ViewNotificationRemoteDataSource {
  CRUD crud;
  ViewNotificationRemoteDataSource(this.crud);
  fetchNotification() async {
    var response = await crud.postData(ApiConstants.VIEW_NOTIFICATION_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}

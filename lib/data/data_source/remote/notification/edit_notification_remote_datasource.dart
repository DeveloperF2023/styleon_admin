import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class EditNotificationRemoteDataSource {
  CRUD crud;
  EditNotificationRemoteDataSource(this.crud);
  editNotification(Map data) async {
    var response =
        await crud.postData(ApiConstants.EDIT_NOTIFICATION_URL, data);
    return response.fold((l) => l, (r) => r);
  }
}

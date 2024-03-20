import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class SendNotificationToSpecificUserRemoteDataSource {
  CRUD crud;
  SendNotificationToSpecificUserRemoteDataSource(this.crud);
  sendNotificationToSpecificUser(Map data) async {
    var response = await crud.postData(
        ApiConstants.SEND_SPECEFIC_USER_NOTIFICATION_URL, data);
    return response.fold((l) => l, (r) => r);
  }
}

import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastMonthNotificationRemoteDataSource {
  CRUD crud;
  FilterOfLastMonthNotificationRemoteDataSource(this.crud);
  filterOfMonth() async {
    var response =
        await crud.postData(ApiConstants.LAST_MONTH_NOTIFICATION_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}

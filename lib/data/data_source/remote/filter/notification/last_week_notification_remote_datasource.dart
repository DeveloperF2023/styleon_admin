import '../../../../../core/class/crud.dart';
import '../../../../../core/constants/api_constants.dart';

class FilterOfLastWeekNotificationRemoteDataSource {
  CRUD crud;
  FilterOfLastWeekNotificationRemoteDataSource(this.crud);
  filterOfLastWeek() async {
    var response =
        await crud.postData(ApiConstants.LAST_WEEK_NOTIFICATION_FILTER, {});
    return response.fold((l) => l, (r) => r);
  }
}

import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class HistoricUsersRemoteDataSource{
  CRUD crud;
  HistoricUsersRemoteDataSource(this.crud);
  historicUsers(String userId)async{
    var response = await crud.postData(ApiConstants.HISTORIC_USERS_URL, {"userId":userId});
    return response.fold((l) => l, (r) => r);
  }
}
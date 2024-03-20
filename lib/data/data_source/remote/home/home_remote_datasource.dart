import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class HomeRemoteDataSource{
  CRUD crud;
  HomeRemoteDataSource(this.crud);
  fetchData()async{
    var response = await crud.postData(ApiConstants.HOME_URL, {});
    return response.fold((l) => l, (r) => r);
  }
}
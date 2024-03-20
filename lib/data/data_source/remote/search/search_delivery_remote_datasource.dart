import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';


class SearchDeliveryRemoteDataSource{
  CRUD crud;
  SearchDeliveryRemoteDataSource(this.crud);
  searchDelivery(String search)async{
    var response = await crud.postData(ApiConstants.SEARCH_DELIVERY_URL, {"search":search});
    return response.fold((l) => l, (r) => r);
  }
}
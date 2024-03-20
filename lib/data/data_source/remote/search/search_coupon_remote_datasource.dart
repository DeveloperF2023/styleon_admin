import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';


class SearchCouponRemoteDataSource{
  CRUD crud;
  SearchCouponRemoteDataSource(this.crud);
  searchCoupon(String search)async{
    var response = await crud.postData(ApiConstants.SEARCH_COUPON_URL, {"search":search});
    return response.fold((l) => l, (r) => r);
  }
}
import '../../../../core/class/crud.dart';
import '../../../../core/constants/api_constants.dart';

class CountCouponRemoteDataSource{
  CRUD crud;
  CountCouponRemoteDataSource(this.crud);
  countCoupon()async{
    var response = await crud.postData(ApiConstants.COUNT_COUPON, {});
    return response.fold((l) => l, (r) => r);
  }
}
import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/count/coupon_count_remote_datasource.dart';

class BrandsController extends GetxController{
  CountCouponRemoteDataSource countCouponRemoteDataSource = CountCouponRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  int? countBrands;

  countBrandsData() async{
    statusRequest  = StatusRequest.loading;
    var response = await countCouponRemoteDataSource.countCoupon();
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        var countCoupon = 0;
        countCoupon = response['data'];
        print("----------------Count Cart ---------------------------");
        print(countCoupon);
        return countCoupon;
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initialDataBrands()async{
    if(countBrands == 0){
      countBrands = 0;
    }else{
      countBrands = await countBrandsData();
    }
  }
}
import 'dart:ui';

import 'package:admin/core/constants/colors.dart';
import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/count/brands_count_remote_datasource.dart';
import '../../../data/data_source/remote/count/coupon_count_remote_datasource.dart';

class CouponController extends GetxController{
  CountBrandsRemoteDataSource countBrandsRemoteDataSource = CountBrandsRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List colors = [
    Color(0xffC53BE8),
    Color(0xffFFA93C),
    Color(0xff3B3B3B),
    Color(0xffA582F8)
  ];
  int? countCoupon;
  countCouponData() async{
    statusRequest  = StatusRequest.loading;
    var response = await countBrandsRemoteDataSource.countBrands();
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        var countBrands = 0;
        countBrands = response['data'];
        print("----------------Count Cart ---------------------------");
        print(countBrands);
        return countBrands;
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initialDataCoupon()async{
    if(countCoupon == 0){
      countCoupon = 0;
    }else{
      countCoupon = await countCouponData();
    }
  }
}
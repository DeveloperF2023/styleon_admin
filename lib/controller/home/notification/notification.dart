import 'package:get/get.dart';

import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/count/coupon_count_remote_datasource.dart';
import '../../../data/data_source/remote/count/notification_count_remote_datasource.dart';

class NotificationController extends GetxController{
  CountNotificationRemoteDataSource countNotificationRemoteDataSource = CountNotificationRemoteDataSource(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  int? countNotification;

  countNotificationData() async{
    statusRequest  = StatusRequest.loading;
    var response = await countNotificationRemoteDataSource.countNotification();
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        var countNotification = 0;
        countNotification = response['data'];
        print("----------------Count Cart ---------------------------");
        print(countNotification);
        return countNotification;
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }

  initialDataNotification()async{
    if(countNotification == 0){
      countNotification = 0;
    }else{
      countNotification = await countNotificationData();
    }
  }
}
import 'package:admin/data/data_source/remote/filter/delivery/last_week_delivery_remote_datasource.dart';
import 'package:admin/presentation/widgets/global/text_app.dart';
import 'package:get/get.dart';
import '../../../core/enum/status_request.dart';
import '../../../core/functions/handling_data.dart';
import '../../../data/data_source/remote/count/categories_count_remote_datasource.dart';
import '../../../data/data_source/remote/count/delivery_count_remote_datasource.dart';
import '../../../data/data_source/remote/filter/delivery/last_month_delivery_remote_datasource.dart';
import '../../../data/data_source/remote/filter/delivery/last_two_week_delivery_remote_datasource.dart';
import '../../../data/data_source/remote/home/orders/fetch_orders_remote_datasource.dart';

class DeliveryController extends GetxController{

  FilterOfLastMonthDeliveryRemoteDataSource filterOfLastMonthDeliveryRemoteDataSource= FilterOfLastMonthDeliveryRemoteDataSource(Get.find());
  FilterOfLastTwoWeekDeliveryRemoteDataSource filterOfLastTwoWeekDeliveryRemoteDataSource = FilterOfLastTwoWeekDeliveryRemoteDataSource(Get.find());
  FilterOfLastWeekDeliveryRemoteDataSource filterOfLastWeekDeliveryRemoteDataSource = FilterOfLastWeekDeliveryRemoteDataSource(Get.find());
  CountDeliveryRemoteDataSource countDeliveryRemoteDataSource = CountDeliveryRemoteDataSource(Get.find());
  FetchOrdersRemoteDataSource fetchOrdersRemoteDataSource = FetchOrdersRemoteDataSource(Get.find());
  List orders = [];
  int? countDelivery;
  List lastMonthDelivery = [];
  List lastWeekDelivery = [];
  List lastTwoWeekDelivery = [];
  List todayDelivery = [];
  String selectedDelivery = "All";
  List<String> delivery = ["All","1Week","2Week","1Month"];
  StatusRequest statusRequest = StatusRequest.none;


  initialDataDelivery()async{
    if(countDelivery == 0){
      countDelivery = 0;
    }else{
      countDelivery = await countDeliveryData();
    }

  }


  countDeliveryData() async{
    statusRequest  = StatusRequest.loading;
    var response = await countDeliveryRemoteDataSource.countDelivery();
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        var countDelivery = 0;
        countDelivery = response['data'];
        print("----------------Count Cart ---------------------------");
        print(countDelivery);
        return countDelivery;
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastMonthOfDelivery() async{
    lastMonthDelivery.clear();
    statusRequest  = StatusRequest.loading;
    var response = await filterOfLastMonthDeliveryRemoteDataSource.filterOfLastMonth();
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        print("this is data of last month of delivery ${response['data']}");
        lastMonthDelivery.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastTwoWeekOfDelivery() async{
    lastTwoWeekDelivery.clear();
    statusRequest  = StatusRequest.loading;
    update();
    var response = await filterOfLastTwoWeekDeliveryRemoteDataSource.filterOfLastTwoWeek();
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        print("this is data of last two week of delivery ${response['data']}");
        lastTwoWeekDelivery.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }

  filterOfLastWeekOfDelivery() async{
    lastWeekDelivery.clear();
    statusRequest  = StatusRequest.loading;
    var response = await filterOfLastWeekDeliveryRemoteDataSource.filterOfLastWeek();
    statusRequest = handlingData(response);
    print("------------------------------------------------------------------------ Controller $response");
    print(response);
    if(StatusRequest.success == statusRequest){
      if(response['status']=="success") {
        print("this is data of last week ${response['data']}");
        lastWeekDelivery.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failure;
      }
    }
  }



}

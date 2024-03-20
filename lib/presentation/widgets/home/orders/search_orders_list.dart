import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/delivery_order_model.dart';
import '../../global/text_app.dart';

class SearchOfOrdersList extends StatelessWidget {
  final List<DeliveryOrderModel> ordersList;
  const SearchOfOrdersList({super.key, required this.ordersList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .2,
      width: double.infinity,
      child: ListView.builder(
          itemCount: ordersList.length,
          shrinkWrap: true,
          itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.only(bottom: width10),
          child: SizedBox(
            height: screenHeight*.08,
            width:screenWidth *.82,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: screenHeight*.07,
                      width: screenWidth *.15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius5),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage("${ApiConstants.IMAGE_ITEMS}/${ordersList[index].productImage}"))
                      ),
                    ),
                    sizeHorizontal(width10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextApp(text: ordersList[index].productName!,fontSize: font16,color: AppColors.textColor,fontWeight: FontWeight.w500,),
                        TextApp(text: "\$${ordersList[index].ordersPrice.toString()}",fontSize: font14,color: AppColors.subtitleColor,fontWeight: FontWeight.bold,),
                        TextApp(text: "Items ${ordersList[index].countProducts.toString()}",fontSize: font14,color: AppColors.subtitleColor,fontWeight: FontWeight.w500,),
                      ],
                    ),
                  ],
                ),
                TextApp(text:DateFormat("MMMEd").format(DateTime.parse("${ordersList[index].ordersDate}")),fontSize: font14,color: AppColors.subtitleColor,fontWeight: FontWeight.w400,),
                if(ordersList[index].ordersStatus == 2)
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.starColor,
                        borderRadius: BorderRadius.circular(radius5)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width5,vertical: height5),
                      child: TextApp(text: "Pending",fontSize: 10,color: AppColors.textColor,),
                    ),
                  ),
                if(ordersList[index].ordersStatus == 3)
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(radius5)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width5,vertical: height5),
                      child: TextApp(text: "Accepted",fontSize: 10,color: AppColors.textColor,),
                    ),
                  ),
                if(ordersList[index].ordersStatus == 4)
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(radius5)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width5,vertical: height5),
                      child: TextApp(text: "Archive",fontSize: 10,color: AppColors.textColor,),
                    ),
                  )
              ],
            ),
          ),
        );
      }),
    );
  }
}

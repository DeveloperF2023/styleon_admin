import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../../data/model/delivery_model.dart';
import '../../global/text_app.dart';

class SearchOfDeliveryList extends StatelessWidget {
  final List<DeliveryModel> deliveryList;
  const SearchOfDeliveryList({super.key, required this.deliveryList});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: screenHeight * .13,
      width: double.infinity,
      child: ListView.builder(
          itemCount: deliveryList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.only(right: width10),
          child: Card(
            surfaceTintColor: AppColors.white,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius5),
            ),
            child: Container(
              width: screenWidth * .7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius5),
                color: AppColors.white,
              ),
              child: Row(
                children: [
                  Container(
                    width: screenWidth * .23,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(radius5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(ImageAssets.deliveryMan))),
                  ),
                  sizeHorizontal(width5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: deliveryList[index].deliveryApprove == 1
                                ? AppColors.primaryColor
                                : AppColors.starColor,
                            borderRadius: BorderRadius.circular(radius5)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width5, vertical: height3),
                          child: deliveryList[index].deliveryApprove == 1
                              ? Row(
                            children: [
                              Icon(Icons.verified,size: font12,color: AppColors.white,),
                              sizeHorizontal(width3),
                              const TextApp(
                                text: 'Approved',
                                color: AppColors.white,
                                fontSize: 10,
                              ),
                            ],
                          )
                              : Row(
                            children: [
                              Icon(Icons.error,size: font12,color: AppColors.textColor,),
                              sizeHorizontal(width3),
                              TextApp(
                                text: 'Rejected',
                                color: AppColors.textColor,
                                fontSize: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextApp(
                        text: "${deliveryList[index].deliveryUsername}",
                        fontSize: font16,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mail,
                            size: font16,
                            color: AppColors.primaryColor,
                          ),
                          sizeHorizontal(width5),
                          TextApp(
                            text: "${deliveryList[index].deliveryEmail}",
                            fontSize: 12,
                            color: AppColors.textColor,

                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.phone_android,
                            size: font16,
                            color: AppColors.primaryColor,
                          ),
                          sizeHorizontal(width5),
                          TextApp(
                            text: "${deliveryList[index].deliveryPhone}",
                            fontSize: 12,
                            color: AppColors.textColor,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: ()async{
                          await launchUrl(Uri.parse("tel:${deliveryList[index].deliveryPhone}"));
                        },
                        child: TextApp(
                          text: "Call",
                          fontSize: font12,
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.green,
                          decorationThickness: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

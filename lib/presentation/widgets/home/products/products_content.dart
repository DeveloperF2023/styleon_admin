import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../data/model/products_model.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../global/text_app.dart';


class ProductContent extends GetView<HomeControllerImpl> {
  final ProductModel productModel;
  const ProductContent(
      {super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImpl());
    return GestureDetector(
      onTap: (){

      },
      child: Padding(
        padding: EdgeInsets.only(right: width10),
        child: Column(
          children: [
            Container(
              height: screenHeight * .25,
              width: screenWidth * .4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius5),
                  image: DecorationImage(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          '${ApiConstants.IMAGE_ITEMS}/${productModel.productImage}'))),
            ),
            Row(
              children: [
                Container(
                  width:screenWidth *.27,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizeVertical(height3),
                      Container(
                        height: screenHeight*.02,
                        child: TextApp(
                          text:
                          "${translateDatabase(productModel.productNameFr, productModel.productName)}",
                          fontSize: font14,
                          color: Colors.grey[700],
                        ),
                      ),
                      TextApp(
                        text: "\$${double.parse(productModel.countPrice!)}",
                        fontSize: font16,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                productModel.productDiscount !=0 ?  Container(
                  decoration: BoxDecoration(
                      color: AppColors.starColor, borderRadius: BorderRadius.circular(radius5)),
                  child: Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: width5,vertical: height3),
                      child: TextApp(text: "-${productModel.productDiscount}%",fontSize: font12,color: AppColors.white,),
                    ),
                  ),
                ):Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

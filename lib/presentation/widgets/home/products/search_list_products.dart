import 'package:flutter/material.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../data/model/products_model.dart';
import '../../global/text_app.dart';

class SearchListOfProducts extends StatelessWidget {
  final List<ProductModel> searchList;
  const SearchListOfProducts({super.key, required this.searchList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * .31,
      width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: searchList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
          },
          child: Padding(
            padding: EdgeInsets.only(right: width10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              '${ApiConstants.IMAGE_ITEMS}/${searchList[index].productImage}'))),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sizeVertical(height3),
                            Container(
                              height: screenHeight*.02,
                              child: TextApp(
                                text:
                                "${translateDatabase(searchList[index].productNameFr, searchList[index].productName)}",
                                fontSize: font14,
                                color: Colors.grey[700],
                              ),
                            ),
                            TextApp(
                              text: "\$${double.parse(searchList[index].countPrice!)}",
                              fontSize: font16,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                      sizeHorizontal(width30),
                      searchList[index].productDiscount !=0 ?  Container(
                        decoration: BoxDecoration(
                            color: AppColors.starColor, borderRadius: BorderRadius.circular(radius5)),
                        child: Center(
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: width5,vertical: height3),
                            child: TextApp(text: "-${searchList[index].productDiscount}%",fontSize: font12,color: AppColors.white,),
                          ),
                        ),
                      ):Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

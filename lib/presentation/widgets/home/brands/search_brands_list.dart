import 'package:flutter/material.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/brands_model.dart';
import '../../global/text_app.dart';

class SearchOfBrandList extends StatelessWidget {
 final List<BrandsModel> brandList;
  const SearchOfBrandList({super.key, required this.brandList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .16,
      width: double.infinity,
      child: ListView.builder(
          itemCount: brandList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return  Padding(
          padding:  EdgeInsets.only(left: width10),
          child: GestureDetector(
            onTap:(){
            },
            child: Column(
              children: [
                Container(
                  height: screenHeight* .13,
                  width: screenWidth *.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:NetworkImage('${ApiConstants.IMAGE_BRANDS}/${brandList[index].brandsImages}'),)
                  ),
                ),
                sizeVertical(height5),
                TextApp(text: "${brandList[index].brandsTitle}",fontSize: 13,color: Colors.grey[700],),
              ],
            ),
          ),
        );
      }),
    );
  }
}

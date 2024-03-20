import 'package:admin/data/model/brands_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../data/model/category_model.dart';
import '../../global/text_app.dart';

class BrandsContent extends StatelessWidget {
  final BrandsModel brandsModel;
  const BrandsContent({super.key, required this.brandsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
      },
      child: Padding(
        padding:  EdgeInsets.only(right: width10),
        child: Column(
          children: [
            Container(
              height: screenHeight* .108,
              width: screenWidth *.23,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:NetworkImage('${ApiConstants.IMAGE_BRANDS}/${brandsModel.brandsImages}'),)
              ),
            ),
            sizeVertical(height5),
            TextApp(text: "${brandsModel.brandsTitle}",fontSize: 13,color: Colors.grey[700],),
          ],
        ),
      ),
    );
  }
}
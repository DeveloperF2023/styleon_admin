import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../data/model/category_model.dart';
import '../../global/text_app.dart';

class CategoriesContent extends GetView<HomeControllerImpl> {
  final CategoriesModel categoriesModel;
  final int index;
  const CategoriesContent(this.index,
      {super.key, required this.categoriesModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: width5, left: width5),
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Container(
              height: screenHeight * .15,
              width: screenWidth * .25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        '${ApiConstants.IMAGE_CATEGORIES}/${categoriesModel.categoryImage}'),
                  )),
            ),
            sizeVertical(height5),
            TextApp(
              text:
                  "${translateDatabase(categoriesModel.categoryNameFr, categoriesModel.categoryName)}",
              fontSize: 13,
              color: Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }
}

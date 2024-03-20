import 'package:flutter/material.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../core/functions/translate_database.dart';
import '../../../../data/model/category_model.dart';
import '../../global/text_app.dart';
class CategoriesSearchList extends StatelessWidget {
  final List<CategoriesModel> categoriesList;
  const CategoriesSearchList({super.key, required this.categoriesList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .2,
      width: double.infinity,
      child: ListView.builder(
          itemCount: categoriesList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
        return Padding(
        padding:  EdgeInsets.only(left: width10),
        child: GestureDetector(
          onTap:(){
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenHeight* .15,
                width: screenWidth *.25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(radius10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:NetworkImage('${ApiConstants.IMAGE_CATEGORIES}/${categoriesList[index].categoryImage}'),)
                ),
              ),
              sizeVertical(height5),
              TextApp(text: "${translateDatabase(categoriesList[index].categoryNameFr, categoriesList[index].categoryName)}",fontSize: 13,color: Colors.grey[700],),
            ],
          ),
        ),
        );
      }),
    );
  }
}

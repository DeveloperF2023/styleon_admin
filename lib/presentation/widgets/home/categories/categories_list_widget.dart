import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home/home_controller.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/category_model.dart';
import 'categories_content.dart';
import 'categories_search_list.dart';
import 'header_categories.dart';

class CategoriesListView extends GetView<HomeControllerImpl> {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width10),
      child: Card(
        surfaceTintColor: AppColors.textColor,
        color: AppColors.textColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius10)),
        child: Container(
          height: screenHeight * .31,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: Colors.grey.shade200, width: 2),
              borderRadius: BorderRadius.circular(radius10)),
          child: Column(
            children: [
              HeaderOfCategories(
                searchController: controller.searchCategoriesController,
                onSearch: controller.onSearchCategories,
                onChanged: (value) {
                  controller.checkValueCategory(value);
                },
              ),
              GetBuilder<HomeControllerImpl>(builder: (controller) {
                return SizedBox(
                  height: screenHeight * .2,
                  width: double.infinity,
                  child: !controller.isSearchCategories
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.categories.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CategoriesContent(
                                categoriesModel: CategoriesModel.fromJson(
                                    controller.categories[index]),
                                index);
                          })
                      : CategoriesSearchList(
                          categoriesList: controller.categoriesList,
                        ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

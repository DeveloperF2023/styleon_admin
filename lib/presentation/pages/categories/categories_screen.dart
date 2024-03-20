import 'package:admin/controller/categories/view_categories_controller.dart';
import 'package:admin/core/constants/colors.dart';
import 'package:admin/core/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/dimensions.dart';
import '../../widgets/categories/view_categories/list_component/grid_view_filtered.dart';
import '../../widgets/global/app_bar.dart';
import '../../widgets/global/filter_icon_widget.dart';
import '../../widgets/global/header_section.dart';
import '../../widgets/orders/list_orders/not_found_order.dart';
import '../../widgets/products/view_products/search_section_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewCategoriesController());
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(
          title: "Categories", automaticallyImplyLeading: false),
      body: SafeArea(
          child: GetBuilder<ViewCategoriesController>(builder: (controller) {
        return Column(
          children: [
            HeaderSection(
              productsLength: controller.categories.length,
              text: 'Search for',
              textButton: "Add Category",
              onPressed: () {
                Get.toNamed(AppRoutes.addCategory);
              },
            ),
            SizedBox(
              height: height42,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * .85,
                    child: SearchSection(
                      onSearch: controller.onSearchCategories,
                      onChanged: (value) {
                        controller.checkValueCategories(value);
                      },
                      controller: controller.searchCategoriesController,
                      searchText: "Search Products",
                    ),
                  ),
                  sizeHorizontal(width5),
                  FilterIconWidget(onPressed: () {
                    controller.onChangeFilter();
                  }),
                ],
              ),
            ),
            controller.isSelected == false
                ? Container()
                : SizedBox(
                    height: screenHeight * .05,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: controller.dropCategories.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(right: width3, left: width3),
                          child: ChoiceChip(
                            label: Text(
                              controller.dropCategories[index],
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: font12,
                                  color: controller.choiceIndex == index
                                      ? Colors.white
                                      : const Color(0xff898fac)),
                            ),
                            selected: controller.choiceIndex == index,
                            selectedColor: AppColors.green,
                            checkmarkColor: AppColors.white,
                            onSelected: (value) {
                              controller.onSelectedChoiceFilter(value, index);
                            },
                            backgroundColor: AppColors.white,
                          ),
                        );
                      },
                    ),
                  ),
            sizeVertical(height10),
            Flexible(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          if (controller.choiceIndex == 0)
                            controller.categories.isNotEmpty
                                ? GridViewFilteredOfCategories(
                                    itemCount: controller.categories.length,
                                    categories: controller.categories,
                                  )
                                : const NotFoundOrder(
                                    notFoundText: "The products"),
                          if (controller.choiceIndex == 1)
                            controller.lastMonthCategories.isNotEmpty
                                ? GridViewFilteredOfCategories(
                                    itemCount:
                                        controller.lastMonthCategories.length,
                                    categories: controller.lastMonthCategories,
                                  )
                                : const NotFoundOrder(
                                    notFoundText: "The products"),
                          if (controller.choiceIndex == 2)
                            controller.lastWeekCategories.isNotEmpty
                                ? GridViewFilteredOfCategories(
                                    itemCount:
                                        controller.lastWeekCategories.length,
                                    categories: controller.lastWeekCategories,
                                  )
                                : const NotFoundOrder(
                                    notFoundText: "The products"),
                        ],
                      );
                    }))
          ],
        );
      })),
    );
  }
}

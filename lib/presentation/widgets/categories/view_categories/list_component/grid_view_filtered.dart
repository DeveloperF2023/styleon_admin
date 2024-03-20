import 'package:admin/controller/products/view_products_controller.dart';
import 'package:admin/data/model/category_model.dart';
import 'package:admin/presentation/widgets/products/view_products/search_component/search_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/dimensions.dart';
import 'content_categories_widget.dart';

class GridViewFilteredOfCategories extends GetView<ViewProductController> {
  const GridViewFilteredOfCategories({super.key, required this.itemCount, required this.categories});
  final int itemCount;
  final List<CategoriesModel> categories;
  @override
  Widget build(BuildContext context) {
    Get.put(ViewProductController());
    return  SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width10,
        ),
        child:!controller.isSearchProducts ?  GridView.builder(
            shrinkWrap: true,
            itemCount: itemCount,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 14,
                mainAxisExtent: 205),
            itemBuilder: (BuildContext context, int index) {
              return ContentOfCategoriesAsGridView(
                categoriesModel: categories[index],);
              //
            }):SearchProductsList(productList: controller.searchProductsList,),
      ),
    );
  }
}


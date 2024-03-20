import 'package:admin/controller/products/view_products_controller.dart';
import 'package:admin/presentation/widgets/products/view_products/search_component/search_product_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/dimensions.dart';
import '../../../../data/model/products_model.dart';
import 'grid_component/content_product_grid_view.dart';

class GridViewFiltered extends GetView<ViewProductController> {
  const GridViewFiltered(
      {super.key, required this.itemCount, required this.products});
  final int itemCount;
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    Get.put(ViewProductController());
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width10,
        ),
        child: !controller.isSearchProducts
            ? GridView.builder(
                shrinkWrap: true,
                itemCount: itemCount,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    mainAxisExtent: 220),
                itemBuilder: (BuildContext context, int index) {
                  return ContentOfProductAsGridView(
                    productModel: products[index],
                  );
                  //
                })
            : SearchProductsList(
                productList: controller.searchProductsList,
              ),
      ),
    );
  }
}

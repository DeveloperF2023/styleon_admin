import 'package:flutter/material.dart';

import '../../../../../core/constants/dimensions.dart';
import '../../../../../data/model/products_model.dart';
import '../grid_component/content_product_grid_view.dart';

class SearchProductsList extends StatelessWidget {
  final List<ProductModel> productList;
  const SearchProductsList({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width5,
        ),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: productList.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 14,
                mainAxisExtent: 215),
            itemBuilder: (BuildContext context, int index) {
              return ContentOfProductAsGridView(
                productModel: productList[index],
              );
              //
            }),
      ),
    );
  }
}

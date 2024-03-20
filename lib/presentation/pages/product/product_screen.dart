import 'package:admin/controller/products/view_products_controller.dart';
import 'package:admin/presentation/widgets/global/app_bar.dart';
import 'package:admin/presentation/widgets/global/filter_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/class/handling_dataview.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/routes.dart';
import '../../widgets/global/header_section.dart';
import '../../widgets/orders/list_orders/not_found_order.dart';
import '../../widgets/products/view_products/grid_view_filtered.dart';
import '../../widgets/products/view_products/search_section_widget.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewProductController());
    return Scaffold(
        backgroundColor: AppColors.white,
        appBar: const AppBarWidget(
            title: "Products", automaticallyImplyLeading: false),
        body: GetBuilder<ViewProductController>(builder: (controller) {
          return SafeArea(
              child: Column(
            children: [
              HeaderSection(
                productsLength: controller.products.length,
                text: 'Products',
                textButton: "Add Product",
                onPressed: () {
                  Get.toNamed(AppRoutes.addProduct);
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
                        onSearch: controller.onSearchProducts,
                        onChanged: (value) {
                          controller.checkValueProducts(value);
                        },
                        controller: controller.searchProductsController,
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
                        itemCount: controller.dropItems.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                EdgeInsets.only(right: width3, left: width5),
                            child: ChoiceChip(
                              label: Text(
                                controller.dropItems[index],
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: font12,
                                    color: controller.choiceIndex == index
                                        ? Colors.white
                                        : Color(0xff898fac)),
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
              HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Flexible(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              if (controller.choiceIndex == 0)
                                controller.products.isNotEmpty
                                    ? GridViewFiltered(
                                        itemCount: controller.products.length,
                                        products: controller.products)
                                    : const NotFoundOrder(
                                        notFoundText: "The products"),
                              if (controller.choiceIndex == 1)
                                controller.lastMonthProducts.isNotEmpty
                                    ? GridViewFiltered(
                                        itemCount:
                                            controller.lastMonthProducts.length,
                                        products: controller.lastMonthProducts)
                                    : const NotFoundOrder(
                                        notFoundText: "The products"),
                              if (controller.choiceIndex == 2)
                                controller.lastWeekProducts.isNotEmpty
                                    ? GridViewFiltered(
                                        itemCount:
                                            controller.lastWeekProducts.length,
                                        products: controller.lastWeekProducts)
                                    : const NotFoundOrder(
                                        notFoundText: "The products"),
                              if (controller.choiceIndex == 3)
                                controller.highPriceProducts.isNotEmpty
                                    ? GridViewFiltered(
                                        itemCount:
                                            controller.highPriceProducts.length,
                                        products: controller.highPriceProducts)
                                    : const NotFoundOrder(
                                        notFoundText: "The products"),
                              if (controller.choiceIndex == 4)
                                controller.lowPriceProducts.isNotEmpty
                                    ? GridViewFiltered(
                                        itemCount:
                                            controller.lowPriceProducts.length,
                                        products: controller.lowPriceProducts)
                                    : const NotFoundOrder(
                                        notFoundText: "The products"),
                            ],
                          );
                        }),
                  ))
            ],
          ));
        }));
  }
}
